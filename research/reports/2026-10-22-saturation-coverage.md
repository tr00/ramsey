# Saturation coverage: global theorem and rooted residual branch

Date: 2026-10-22. Author: Main, alone. User asked whether excluding saturated degree18 neighborhoods can imply nonexistence of all R(5,5,43) graphs.

[The proof note](../n43/d18/saturation_coverage.md) records three author proofs ready for independent review:

- Nonemptiness of R(s,t,n) is equivalent to existence of a globally K_s-saturated member, by a maximum K_s-free supergraph.
- Preserving a degree18 root and augmenting only its neighborhood gives a complete cover by locally K4-saturated neighborhoods and a residual external-blocker branch. Every locally safe missing A-edge in the residual has a common-neighbor triangle located in A+B+B or B+B+B. Excluding both branches excludes all degree18-rooted candidates; a separate coverage theorem remains needed for graphs without degree18 vertices.
- An explicit eight-vertex analogue K1 join complement(C7) is K5-saturated and K5/I5-free, yet all seven degree5 neighborhoods are K1 join P4 and are not K4-saturated. This refutes a general global-to-local saturation principle, without claiming to disprove the special order43 statement.

The [checker](2026-10-22-saturation-coverage/check.py) exhaustively verifies the small graph's homogeneous sets, global saturation, degree sequence, and every degree5 neighborhood. [Output](2026-10-22-saturation-coverage/checks.json) retains its edge list. Replay: python3 research/reports/2026-10-22-saturation-coverage/check.py. PASS.

The58-edge saturated-neighborhood floor retains its separate pending review status. No full degree18 or order43 branch is closed. No solver, package install, download, graph catalogue, canonicalizer, Lean change, engine change, staging, commit or subagent was used in this coverage task. Existing shared indexes, WORK rows and prior files are preserved.
