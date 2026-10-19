#pragma once

namespace ramsey
{

// Streams solver stdout and normalizes terminal status: SAT 10, UNSAT 20, timeout 4, unknown 5.
// Errors return 1, memory exhaustion 3, exec failures 126/127, and signals 128+signal.
// Process-wide signal forwarding makes this a single-supervisor interface.
int run_solver(const char *executable, char *const arguments[]);

} // namespace ramsey
