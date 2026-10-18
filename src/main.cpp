#include "engine.hpp"

#include <charconv>
#include <iostream>
#include <stdexcept>
#include <string_view>

#include <getopt.h>

namespace
{
void usage(const char *program)
{
    std::cout << "Usage: " << program << " B_FILE -o OUTPUT [OPTIONS] [-- ROUNDINGSAT_ARGS...]\n"
              << "\nGenerate the degree-18 Ramsey OPB instance and launch local RoundingSat.\n"
              << "  -o, --output PATH    OPB destination (required)\n"
              << "  -i, --index N        One-based graph6 record (default: 1)\n"
              << "  -g, --generate-only  Write OPB without solving\n"
              << "  -h, --help           Show this help\n"
              << "Arguments after -- go directly to RoundingSat.\n";
}
} // namespace

int main(int argc, char **argv)
{
    try
    {
        ramsey::Options options;
        int frontend_argc = argc;
        for (int i = 1; i < argc; ++i)
        {
            if (std::string_view(argv[i]) == "--")
            {
                frontend_argc = i;
                options.solver_arguments.assign(argv + i + 1, argv + argc);
                break;
            }
        }
        static const option long_options[] = {
            {"output", required_argument, nullptr, 'o'},
            {"index", required_argument, nullptr, 'i'},
            {"generate-only", no_argument, nullptr, 'g'},
            {"help", no_argument, nullptr, 'h'},
            {nullptr, 0, nullptr, 0},
        };
        opterr = 0;
        int argument;
        // Return positional arguments in order rather than permuting argv.
        while ((argument = ::getopt_long(frontend_argc, argv, "-:o:i:gh", long_options, nullptr)) != -1)
        {
            switch (argument)
            {
            case 1:
                if (!options.input.empty())
                    throw std::invalid_argument("only one B file is accepted");
                if (*optarg == '\0')
                    throw std::invalid_argument("input path must not be empty");
                options.input = optarg;
                break;
            case 'o':
                options.output = optarg;
                break;
            case 'i': {
                const std::string_view text(optarg);
                const auto parsed = std::from_chars(text.data(), text.data() + text.size(), options.index);
                if (parsed.ec != std::errc{} || parsed.ptr != text.data() + text.size() || options.index == 0)
                    throw std::invalid_argument("--index must be a positive integer");
                break;
            }
            case 'g':
                options.generate_only = true;
                break;
            case 'h':
                usage(argv[0]);
                return 0;
            default:
                throw std::invalid_argument("unknown option or missing value; use --help");
            }
        }
        if (options.input.empty())
            throw std::invalid_argument("a B graph6 file is required");
        if (options.output.empty())
            throw std::invalid_argument("-o/--output is required");
        return ramsey::run(options);
    }
    catch (const std::exception &error)
    {
        std::cerr << "ramsey: " << error.what() << '\n';
        return 2;
    }
}
