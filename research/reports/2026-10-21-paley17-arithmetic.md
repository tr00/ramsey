# Paley-17 arithmetic exploration

Date: 2026-10-21. Task: `paley-arithmetic-20261021`.
Author and checker: /root, working alone. User requested exploration of the
number-theoretic construction for exploitable structural insights.

## Results and status

[The proof/research note](../../docs/paley17_arithmetic.md) records seven claims,
all **ready for independent review**, with no executable pruning authority
until review. No novelty or full K1 exclusion is claimed.

- All Paley-17 triangles and independent triples are arithmetic progressions:
  square and nonsquare steps respectively, 68 of each. Each core nonedge has
  an explicit associated antineighbor triangle `b +/- 3a, b`.
- The quadratic-character matrix satisfies `S^2=17I-J`. Exact integer
  signature energy and joint Gram identities give coordinates for the
  attachment and mixed-codegree constraints.
- There are 7,991 legal I3-free omission sets, in 72 affine subgroup orbits.
  Only 51 have size eight: 17 antineighborhoods and 34 quartic-coset sets,
  in two orbits. The S11 eight-type does not embed in Paley-17.
- At most four size-eight omissions can coexist. Four prohibit any further
  omission of size seven; three prohibit four mutually compatible sevens.
- These facts give a packing bound of 68 core-to-seven-cell edges. Complete
  enumeration of the remaining total-68 and total-69 cases finds that every
  family forces an independent four-set in T. The proposed improved minimum
  is therefore **70** for a K5/I4-free extension of a specified Paley core.
- On the retained Paley classification premise, K1 gets `p,q>=70`,
  `h<=14`, and `r<=185`, versus the existing 64,18,191 bounds. The
  strengthened necessary scalar envelope has 678 (h,L,R) profiles.

These one-side restrictions need no (5,5,43) ambient graph. Applying them to
all K1 cores retains the external unique-core classification; the present
session does not prove that classification. The mixed-core 289-bit completion
problem and the full K1 branch remain open. The new 70-edge bound is not
asserted sharp, and no local extension at total 70 is asserted.

## Exact validation and artifacts

No downloaded catalogue, graph canonicalizer, SAT solver, numeric eigensolver,
package installation, Lean edit, engine edit or third-party edit was used.
The arithmetic inputs are the explicit residues modulo 17.

The [artifact manifest](2026-10-21-paley17-arithmetic/manifest.json) records
source/output SHA-256 hashes, bytes, base revision and Python version. The
package is about 2 MB. Each Python command below writes its same-name JSON
output under `research/reports/2026-10-21-paley17-arithmetic/`:

```sh
python3 research/reports/2026-10-21-paley17-arithmetic/subsets.py
python3 research/reports/2026-10-21-paley17-arithmetic/arithmetic_checks.py
python3 research/reports/2026-10-21-paley17-arithmetic/packing.py
python3 research/reports/2026-10-21-paley17-arithmetic/extend_packing.py
python3 research/reports/2026-10-21-paley17-arithmetic/high_signatures.py
python3 research/reports/2026-10-21-paley17-arithmetic/equality68.py
python3 research/reports/2026-10-21-paley17-arithmetic/equality69.py
python3 research/reports/2026-10-21-paley17-arithmetic/forced_obstructions.py
python3 research/reports/2026-10-21-paley17-arithmetic/verify_finite.py
python3 research/reports/2026-10-21-paley17-arithmetic/verify_certificates.py
```

`subsets.py` checks all 131,072 masks using recursive I3 detection and an
independent forbidden-triple test, and checks the explicit 136 affine
permutations, all four-subsets of the core and all entries of S^2.
`arithmetic_checks.py` verifies the AP characterization, the 51 explicit
quartic/antineighborhood omissions, block pair multiplicities, and the
integer character moments for all 7,991 legal signatures.

`packing.py` enumerates all cliques of the 51-signature compatibility graph;
`high_signatures.py` retains a complete affine orbit cover for eight-signature
bases and exact compatibility searches among size-seven masks.

At attachment totals 68 and 69, the discovery implementation retains five
and 8,371 families after normalizing their size-eight bases. Every remaining
mask is included; equivalences can cause harmless duplicate cases. It checks
15 and 32,737 T-edge assignments respectively, with zero valid local sides.
The second implementation `verify_finite.py` independently regenerates the
same mask lists using numbered nonedge resources and nonsquare APs, then
constructs whole-side K5/I4 obstruction clauses. It agrees on counts and
outcomes. Both implementations are authored by the same person; this is a
cross-check, not independent author acceptance.

`forced68.json` and `forced69.json` retain an explicit T-I4 and six forcing
core triangles for every family. `verify_certificates.py` checks them directly
against the residue definition. All families also force a mixed independent
four-set, with an independent T triple and a commonly omitted core vertex.
The certificates are fixed-core local evidence; complete K1 coverage still
needs the retained classification premise and all remaining completions.

An initial p=68 discovery used a slow flat combinations loop and was
interrupted after about a minute; it supplied no result. Replacing it by
compatible recursive choices gave a complete subsecond run. The final p=69
run took tens of seconds. No timeout or interrupted output supports any
mathematical conclusion.

The scalar projection audit checks only integer aggregate inequalities.
Local links/anchors in the new note, report and collection entry are checked.
Existing proof bodies, review states and hashes were preserved. Completed
ownership was removed from WORK.md; all other active rows remain.
