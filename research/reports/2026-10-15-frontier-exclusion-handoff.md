# Handoff: full equality-frontier exclusion

Date: 2026-10-15. Task: `frontier-exclusion-handoff-20261015`.
Author/self-auditor: Codex. Base HEAD: `ab4941bd3e4b4b0bcd89098482f5767bd3fc5925`.

This was an author-stage candidate closure of the entire degree-18 x136
branch. [Independent acceptance on 2026-10-19](2026-10-19-x136-frontier-closure.md)
now establishes x>=137 on the proof's external premises. The original ready
state did not itself authorize accepted navigation or pruning.

Proof: [frontier_exclusion_handoff.md](../n43/d18/x136/frontier_exclusion_handoff.md).
Reviewed source SHA-256:
`c07f097358bd42e8c11957660f4f25dce3784608b143a87bc86a16d2bc0561cb`.

| Stable claim anchor | Closure step |
| --- | --- |
| `claim-frontier-handoff-double-domination` | An all-degree-eight I4 has >=2 neighbors at every other A vertex, using its saturated B singleton triangles. |
| `claim-frontier-handoff-three-anchors` | Three disjoint such anchors force e(A)<=84<85. |
| `claim-frontier-handoff-low-degrees` | Deletion caps exclude two degree<=7 vertices; Turán equality excludes a sole degree 6 vertex. At most one degree 7 remains. |
| `claim-frontier-handoff-exclusion` | Projected columns require >=120 support incidences. With one degree 7, the support has only 109; the no-degree 7 case also exceeds its budget. |

Dependencies are the accepted degree-eight anchor, full-interface tau>=5,
core caps36/42/48 at orders11/12/13, and recorded smaller Ramsey and
neighborhood extrema. Exact dependency hashes are in the proof. Author
checks did not independently recertify those premises.

Author validation rechecked witnesses, ambient types, deletion and projection
quantifiers; standard-library arithmetic checked18 strict deletion comparisons
and both incidence contradictions, while exact Fraction checks covered inherited
core residuals. All passed, as did `git diff --check`. The scalar check remains:

```sh
python3 - <<'PY'
from math import comb

caps = {0:0, 1:0, 2:1, 3:3, 4:5, 5:8, 6:12,
        7:16, 8:21, 9:27, 10:31, 11:36, 12:42, 13:48}
def b4(ell):
    q, r = divmod(ell, 4)
    return r*comb(q+1, 2)+(4-r)*comb(q, 2)

for ell in range(2, 11):
    assert 53-5*ell+b4(ell) > caps[14-ell]
    assert 29-3*ell+b4(ell) > caps[10-ell]
assert 96-24+12 == 84
assert 85-32-6+2 == 49 > 48
assert 85-64-6+8+4 == 27
assert 6+3*10 == 36 > 32
assert (120+8)//9 == 14 and (234-170)//5 == 12
assert (96+8)//9 == 11 and (228-170)//5 == 11
assert 170-7-11*8 == 75
assert 75-5*13 == 10
assert 10+7+8+8 == 33 > 32
assert 11*9+10 == 109 < 120
print('PASS: candidate-frontier formula checks')
PY
```

Formula checks are not independent mathematical review or formal proof
certificates. No graph enumeration, solver, proof checker, canonicalizer,
download, installation, or novelty review took place.


These are formula checks, not graph enumeration, independent review or formal
proof certificates. No solver, download or novelty review occurred. The user
authorized the selective handoff commit; full integration followed the later
independent review. Higher-x d18 and other order-43 schemes remain open, and
the global Ramsey interval is unchanged.
