#include "solver.hpp"

#include <cerrno>
#include <csignal>
#include <cstdlib>
#include <iostream>
#include <stdexcept>
#include <string>
#include <string_view>
#include <vector>

#include <sys/wait.h>
#include <unistd.h>

namespace
{
void require(bool condition, const char *message)
{
    if (!condition)
        throw std::runtime_error(message);
}

void write_all(std::string_view text)
{
    while (!text.empty())
    {
        const auto size = ::write(STDOUT_FILENO, text.data(), text.size());
        if (size < 0 && errno == EINTR)
            continue;
        if (size <= 0)
            ::_exit(99);
        text.remove_prefix(static_cast<std::size_t>(size));
    }
}

struct Result
{
    int code;
    std::string output;
};

Result invoke(const char *self, const char *executable, std::string output, int raw, bool interrupt = false)
{
    int pipe[2];
    require(::pipe(pipe) == 0, "pipe failed");
    const pid_t supervisor = ::fork();
    require(supervisor >= 0, "fork failed");
    if (supervisor == 0)
    {
        ::close(pipe[0]);
        if (::dup2(pipe[1], STDOUT_FILENO) < 0)
            ::_exit(99);
        ::close(pipe[1]);
        auto exit_code = std::to_string(raw);
        std::vector<char *> arguments{const_cast<char *>(self),
                                      const_cast<char *>(interrupt ? "--signal-child" : "--child"), output.data(),
                                      exit_code.data(), nullptr};
        ::_exit(ramsey::run_solver(executable, arguments.data()));
    }
    ::close(pipe[1]);
    Result result{};
    char buffer[1024];
    bool sent = false;
    for (;;)
    {
        const auto size = ::read(pipe[0], buffer, sizeof(buffer));
        if (size < 0 && errno == EINTR)
            continue;
        require(size >= 0, "capture read failed");
        if (size == 0)
            break;
        result.output.append(buffer, static_cast<std::size_t>(size));
        if (interrupt && !sent && result.output.find("ready\n") != std::string::npos)
        {
            require(::kill(supervisor, SIGTERM) == 0, "interrupt failed");
            sent = true;
        }
    }
    ::close(pipe[0]);
    int status;
    while (::waitpid(supervisor, &status, 0) < 0)
        require(errno == EINTR, "wait failed");
    require(WIFEXITED(status), "supervisor did not exit normally");
    result.code = WEXITSTATUS(status);
    return result;
}
} // namespace

int main(int argc, char **argv)
{
    if (argc >= 2 && std::string_view(argv[1]) == "--signal-child")
    {
        sigset_t set;
        sigemptyset(&set);
        sigaddset(&set, SIGTERM);
        ::sigprocmask(SIG_BLOCK, &set, nullptr);
        write_all("ready\n");
        int signal;
        if (::sigwait(&set, &signal) != 0 || signal != SIGTERM)
            return 99;
        write_all("s UNKNOWN\n");
        return 0;
    }
    if (argc == 4 && std::string_view(argv[1]) == "--child")
    {
        write_all(argv[2]);
        return std::atoi(argv[3]);
    }
    try
    {
        // These raw statuses reproduce RoundingSat's ambiguous success and timeout paths.
        for (const auto &[text, expected] :
             std::vector<std::pair<std::string, int>>{{"s SATISFIABLE\n", 10},
                                                      {"s UNSATISFIABLE\n", 20},
                                                      {"s TIMELIMIT\n", 4},
                                                      {"s UNKNOWN\n", 5},
                                                      {"c no terminal status\n", 1},
                                                      {"s SATISFIABLE\ns UNSATISFIABLE\n", 1},
                                                      {"s unsupported\n", 1}})
        {
            const auto result = invoke(argv[0], argv[0], text, 0);
            require(result.code == expected, "incorrect normalized status");
            require(result.output == text, "solver output was altered");
        }
        require(invoke(argv[0], argv[0], "s TIMELIMIT\n", 4).code == 4, "exception timeout was not normalized");
        require(invoke(argv[0], argv[0], "s SATISFIABLE\n", 1).code == 1, "solver error accepted as SAT");
        require(invoke(argv[0], argv[0], "s UNKNOWN\n", 3).code == 3, "memory error was lost");
        require(invoke(argv[0], "/ramsey-nonexistent-solver", "", 0).code == 127, "missing executable status was lost");
        const auto large = "c " + std::string(80000, 'x') + "\ns SATISFIABLE\r\nv x1 -x2";
        const auto result = invoke(argv[0], argv[0], large, 0);
        require(result.code == 10 && result.output == large, "stream boundaries or unterminated output broke status");
        const auto interrupted = invoke(argv[0], argv[0], "", 0, true);
        require(interrupted.code == 128 + SIGTERM && interrupted.output == "ready\ns UNKNOWN\n",
                "termination was not forwarded to the child and normalized");
        std::cout << "PASS: solver decisions, ambiguous timeouts, failures, streaming and signal forwarding\n";
        return 0;
    }
    catch (const std::exception &error)
    {
        std::cerr << "FAIL: " << error.what() << '\n';
        return 1;
    }
}
