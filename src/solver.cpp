#include "solver.hpp"

#include <array>
#include <cerrno>
#include <csignal>
#include <cstring>
#include <iostream>
#include <string_view>
#include <system_error>

#include <sys/wait.h>
#include <unistd.h>

namespace ramsey
{
namespace
{
volatile std::sig_atomic_t solver_pid = 0;
volatile std::sig_atomic_t received_signal = 0;
constexpr std::array signals{SIGINT, SIGTERM, SIGHUP, SIGPIPE};

void forward_signal(int signal)
{
    const int saved_errno = errno;
    received_signal = signal;
    if (solver_pid > 0)
        ::kill(static_cast<pid_t>(solver_pid), signal);
    errno = saved_errno;
}

class SignalForwarding
{
  public:
    SignalForwarding()
    {
        sigemptyset(&blocked_);
        for (int signal : signals)
            sigaddset(&blocked_, signal);
        if (::sigprocmask(SIG_BLOCK, &blocked_, &previous_mask_) != 0)
            throw std::system_error(errno, std::generic_category(), "block solver signals");
        struct sigaction action{};
        action.sa_handler = forward_signal;
        sigemptyset(&action.sa_mask);
        for (std::size_t i = 0; i < signals.size(); ++i)
        {
            if (::sigaction(signals[i], &action, &previous_[i]) != 0)
            {
                const int error = errno;
                for (std::size_t j = 0; j < i; ++j)
                    ::sigaction(signals[j], &previous_[j], nullptr);
                ::sigprocmask(SIG_SETMASK, &previous_mask_, nullptr);
                throw std::system_error(error, std::generic_category(), "install solver signal forwarding");
            }
        }
        received_signal = 0;
    }
    ~SignalForwarding()
    {
        restore();
    }
    void start(pid_t child)
    {
        solver_pid = child;
        ::sigprocmask(SIG_SETMASK, &previous_mask_, nullptr);
    }
    void restore()
    {
        ::sigprocmask(SIG_BLOCK, &blocked_, nullptr);
        solver_pid = 0;
        for (std::size_t i = 0; i < signals.size(); ++i)
            ::sigaction(signals[i], &previous_[i], nullptr);
        ::sigprocmask(SIG_SETMASK, &previous_mask_, nullptr);
    }

  private:
    sigset_t blocked_{};
    sigset_t previous_mask_{};
    std::array<struct sigaction, signals.size()> previous_{};
};

class Status
{
  public:
    void consume(std::string_view bytes)
    {
        for (char byte : bytes)
        {
            if (byte == '\n')
                finish_line();
            else if (size_ < line_.size())
                line_[size_++] = byte;
            else
                overflow_ = true;
        }
    }
    int finish()
    {
        if (size_ != 0)
            finish_line();
        return invalid_ ? 1 : code_;
    }

  private:
    void finish_line()
    {
        std::string_view line(line_.data(), size_);
        if (line.ends_with('\r'))
            line.remove_suffix(1);
        if (line.starts_with("s "))
        {
            const int code = line == "s SATISFIABLE"     ? 10
                             : line == "s UNSATISFIABLE" ? 20
                             : line == "s TIMELIMIT"     ? 4
                             : line == "s UNKNOWN"       ? 5
                                                         : 1;
            if (overflow_ || code == 1 || (code_ != 1 && code_ != code))
                invalid_ = true;
            code_ = code;
        }
        size_ = 0;
        overflow_ = false;
    }
    std::array<char, 64> line_{};
    std::size_t size_ = 0;
    int code_ = 1;
    bool overflow_ = false;
    bool invalid_ = false;
};

int wait_for(pid_t child)
{
    siginfo_t info{};
    while (::waitid(P_PID, static_cast<id_t>(child), &info, WEXITED | WNOWAIT) < 0)
        if (errno != EINTR)
            throw std::system_error(errno, std::generic_category(), "wait for RoundingSat");
    sigset_t blocked, previous;
    sigemptyset(&blocked);
    for (int signal : signals)
        sigaddset(&blocked, signal);
    if (::sigprocmask(SIG_BLOCK, &blocked, &previous) != 0)
        throw std::system_error(errno, std::generic_category(), "block signals while reaping RoundingSat");
    int status;
    const auto result = ::waitpid(child, &status, 0);
    const int error = errno;
    solver_pid = 0;
    ::sigprocmask(SIG_SETMASK, &previous, nullptr);
    if (result < 0)
        throw std::system_error(error, std::generic_category(), "reap RoundingSat");
    return status;
}
} // namespace

int run_solver(const char *executable, char *const arguments[])
{
    SignalForwarding forwarding;
    std::array<int, 2> pipe;
    if (::pipe(pipe.data()) != 0)
        throw std::system_error(errno, std::generic_category(), "create solver output pipe");
    const pid_t child = ::fork();
    if (child < 0)
    {
        const int error = errno;
        ::close(pipe[0]);
        ::close(pipe[1]);
        throw std::system_error(error, std::generic_category(), "fork RoundingSat");
    }
    if (child == 0)
    {
        ::close(pipe[0]);
        if (::dup2(pipe[1], STDOUT_FILENO) < 0)
            ::_exit(126);
        if (pipe[1] != STDOUT_FILENO)
            ::close(pipe[1]);
        forwarding.restore();
        ::execv(executable, arguments);
        const int error = errno;
        constexpr std::string_view message = "ramsey: cannot execute RoundingSat\n";
        const auto ignored = ::write(STDERR_FILENO, message.data(), message.size());
        (void)ignored;
        ::_exit(error == ENOENT || error == ENOTDIR ? 127 : 126);
    }
    ::close(pipe[1]);
    forwarding.start(child);
    Status terminal;
    int status;
    try
    {
        std::array<char, 4096> buffer;
        for (;;)
        {
            const auto size = ::read(pipe[0], buffer.data(), buffer.size());
            if (size == 0)
                break;
            if (size < 0)
            {
                if (errno == EINTR)
                    continue;
                throw std::system_error(errno, std::generic_category(), "read solver output");
            }
            terminal.consume({buffer.data(), static_cast<std::size_t>(size)});
            std::size_t offset = 0;
            while (offset < static_cast<std::size_t>(size))
            {
                const auto written = ::write(STDOUT_FILENO, buffer.data() + offset, size - offset);
                if (written < 0)
                {
                    if (errno == EINTR)
                        continue;
                    throw std::system_error(errno, std::generic_category(), "forward solver output");
                }
                offset += static_cast<std::size_t>(written);
            }
        }
        ::close(pipe[0]);
        pipe[0] = -1;
        status = wait_for(child);
    }
    catch (...)
    {
        if (pipe[0] >= 0)
            ::close(pipe[0]);
        ::kill(child, SIGKILL);
        wait_for(child);
        if (received_signal != 0)
            return 128 + received_signal;
        throw;
    }
    if (received_signal != 0)
        return 128 + received_signal;
    if (WIFSIGNALED(status))
        return 128 + WTERMSIG(status);
    const int raw = WEXITSTATUS(status);
    if (raw == 126 || raw == 127 || raw == 3)
        return raw;
    const int code = terminal.finish();
    if ((raw == 0 && code != 1) || (raw == 4 && code == 4))
        return code;
    std::cerr << "ramsey: RoundingSat failed or did not emit a consistent terminal status (exit " << raw << ")\n";
    return 1;
}

} // namespace ramsey
