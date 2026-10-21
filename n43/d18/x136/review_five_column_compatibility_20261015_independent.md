# Independent review of the degree-eight anchor and four-transversal exclusion

Editorially condensed on 2026-10-21; [original audit and lineage](../../../reports/2026-10-21-research-cleanup.md).

Date: 2026-10-15.

Author: Codex coordinator `/root`, author and self-auditor of the target note.
Independent reviewer: Codex agent `/root/audit_five_columns`, task token
`audit-five-columns-20261015-independent`. These are distinct agents. The
reviewer did not contribute to or edit the target proof, its dependencies,
shared indexes, or the Git index, and spawned no further agents.

Claim(s):

- [Core caps](five_column_compatibility.md#claim-five-columns-core-caps).
- [Low-degree nontransversality](five_column_compatibility.md#claim-five-columns-low-transversal).
- [Degree-eight anchor](five_column_compatibility.md#claim-five-columns-degree-eight-anchor).
- [No four-set transversal](five_column_compatibility.md#claim-five-columns-no-four-transversal).

Reviewed revision: input HEAD
`7ebbef265ef9b55746b798b337b86e4fd6140045`; exact uncommitted target
`n43/d18/x136/five_column_compatibility.md`, SHA-256
`a688d0b96de80dba90e77b6a0f918aa93754635d8e81e369f93e9b480de9789b`.
Acceptance applies to this exact text. Mathematical changes require renewed
review; metadata integration must preserve this provenance.

Outcome: **accepted for all four claims on the recorded external premises**.
No mathematical gap or requested correction was found. This is independent
mathematical review, not formal verification or an order-43 decision.

## Dependencies and remaining external premises

| File | SHA-256 |
| --- | --- |
| `n43/d18/frontier_band.md` | `0b8eaa6bd7ca0c6ea8691409112754ab2f0d4b2730166ff4d843b5b807269a54` |
| `n43/d18/transversal_four.md` | `4c084b03583248dc7c7ed56324ec5b6801bdca5278cf4fc17fa7e845dc07825e` |
| `n43/d18/x136/small_columns.md` | `f542dc5f73640d4d9b9da8790638dfd2d546feed79c5d8633d2ed3155f680733` |
| `n43/d18/x136/r2/low_excess_columns.md` | `e855ca074447be16c6d42a1924d067702972e1d7147b7522f121bf08c2fb9dff` |
| `n43/d18/x136/pairwise_small_refinements.md` | `3900dbde7907b8c08feecb7d8dd7582be491c1bff50b1cfbe23476bd3d6b5c85` |
| `n43/d18/x136/transversal_five_attempt.md` | `2073f1bb0c9390795c352a226f9760ccad6767f709fddf8cc139a769f8727e4c` |
| `n43/d18/pivot_classes.md` | `43d4ff670667705f4f974ef69dfe37a1dc43aa09e7825a2fc7448cff60d76233` |
| `n43/d18/x136/r4/exclusion.md` | `718d7efd114850a86715f2e4d2f28cc8d14bd2084390fc999f1120e6a6b344a0` |
| `docs/mathematical_baseline.md` | `e6ea1c070e32ac04a73eb53a5634921acb7fe6d02123a3c7d35a710f262a698e` |
| `n43/reductions.md` | `2c3ed9bb38d20cf9010d8a217d68556c485cd9204702b4540c87a9245c88f41f` |
| `docs/theory_phase_1.md` | `679f3b84f848ac32564538af833fd1b681659417bde55f0bb6262dfb25fc66fd` |

The small Ramsey values, published extrema85/79 at (4,5,18/17), maximum50
at (4,4,14), minimum50 at (4,4,15), and Turan remain recorded premises.
Order14 minimum41 and B24 census bounds are contextual, not needed here.

The arbitrary-transversal floor was checked at
`r2/low_excess_columns.md#claim-r2-low-excess-01`.

## Claim checks

| Claim | Outcome | Decisive check |
| --- | --- | --- |
| core caps | accepted | Goodman retains both triangle and independent-triple terms; affine bounds at every allowed degree give caps16/21/27/31/37/43/49 at orders7..13. |
| low-degree nontransversality | accepted | All ell0..11 cases covered: tau>=4 excludes ell<=3, the abstract-transversal degree floor9 excludes ell4, and 85-7ell+b4(ell) exceeds each remaining core cap. |
| degree-eight anchor | accepted | Total degree 170 and ceiling13 bound the full low-degree set by ten; an I4 avoiding it has degrees>=8, capped at32 by actual B singleton capacities. Equality forces four degree 8 vertices and 12 singleton/12 pair signatures. |
| no-four-transversal | accepted | Every abstract four-transversal has member degrees>=9 and misses the forced degree 8 I4. Thus tau>=5, all actual columns have size>=5, and r>=1 is excluded. |

The row identity and degree-sum cap require the full x136 interface, not
an isolated85-edge A. The anchor is not unique or canonical. The necessary
r0:s8..10 range was not an existence claim or an x136 closure at this stage.

## Reproducible arithmetic check and permitted use

The reviewer's exact rational check passed:

```python
from fractions import Fraction as Q
from math import comb

f = lambda d: min(d*d//4, 3*d//2)
rows = [(7,0,6,Q(7,2),31), (8,0,7,Q(4),42),
        (9,0,8,Q(5,2),43), (10,1,8,Q(6),74),
        (11,2,8,Q(11,2),82), (12,3,8,Q(6),98),
        (13,4,8,Q(9,2),100)]
caps = [16,21,27,31,37,43,49]
for (m,lo,hi,a,c), cap in zip(rows,caps):
    for d in range(lo,hi+1):
        g = f(d)+f(m-1-d)+Q(3,2)*d*(m-1-d)
        assert g+a*d <= c
    rational_cap = Q(m*c-3*comb(m,3))/(2*a)
    assert rational_cap.numerator//rational_cap.denominator == cap
for ell, cap in zip(range(5,12),reversed(caps)):
    q,r = divmod(ell,4)
    parts = [q+1]*r+[q]*(4-r)
    b4 = sum(comb(p,2) for p in parts)
    assert 85-7*ell+b4 > cap
assert 234-6*11 == 168 < 170
assert 4*(17-8) == 12+2*12 == 36
assert 17-8-3 == 6
```

Use the accepted predicates only with their stated premise chain and complete
anchor/interface coverage. This review permits equality column propagation
and r>=1 termination, not an isolated-neighborhood theorem, canonical-root
omission, or whole x136/d18/order43 closure. No novelty review, formal
certificate, solver or catalogue recertification was supplied.
