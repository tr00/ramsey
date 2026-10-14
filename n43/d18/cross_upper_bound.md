# An unconditional upper bound on the degree-18 cross count

Date: 2026-10-14. Author: Codex cross-upper-bound task. Input revision:
`49bd3637b8e6763ac6fbd3bd5c267155b0f1cb27`. Mathematical work only;
no graph enumeration, solver, catalogue acquisition, or installation.
Author self-audit completed; independent review pending. No novelty claim.

**Conclusion:** for every degree-18 pivot of an order-43 (5,5)-free graph,

```text
136 <= x=e(A,B) <= 288.
```

The upper bound is already implicit in the existing cross-edge corridor.
It applies to an arbitrary degree-18 pivot and needs no regularity,
small-excess assumption, complement normalization, or special root choice.
It uses the established 24-vertex (4,5) edge extremum as an external premise.

## 1. Setting and premises

Let G have 43 vertices, no K5, and no independent five-set. Fix any vertex
v of degree 18. Put A=N_G(v), B=M_G(v), a=e(G[A]), b=e(G[B]), and
x=e_G(A,B). Then |A|=18, |B|=24, A is (4,5)-free, and B is
(5,4)-free. In particular, A may contain I4; B has no I4.

The published premises already recorded in
[reduction index Section 8.1](../reductions.md#81-published-internal-edge-ranges)
are

```text
50 <= a <= 85,
116 <= e(complement G[B]) <= 132,
144 <= b <= 160.
```

The census citation is Angeltveit and McKay, *R(5,5)<=46*,
arXiv:2409.15709v2, Appendix A, Table 1; see the existing
[method review](../../docs/upper_bound_method_review.md) for the project's
reading and retrieval provenance. This task did not acquire the census or
independently replay its proof.

The established Ramsey number R(4,5)=25 implies every global degree is
between 18 and 24. Sources are recorded in
[baseline](../../docs/mathematical_baseline.md).

## 2. Uniform upper bound and equality conditions

<a id="claim-cross-upper-corridor"></a>

```text
Claim ID: n43/d18/cross_upper_bound.md#claim-cross-upper-corridor
Kind: local-deduction
Review state: ready
Scope: every G and every degree-18 v in Section 1
Dependencies: R(4,5)=25; the published e(complement B)<=132
Conclusion: x<=288; equality forces b=144 and d_G(y)=24 for every y in B
Search use: none pending independent review of this note; the pre-existing
indexed corridor retains its existing status
Reviews: none
```

There are no v-B edges. Counting degrees on B gives exactly

```text
2b+x = sum_(y in B) d_G(y) <= 24*24 = 576.
```

The published maximum e(complement B)<=132 gives

```text
b = C(24,2)-e(complement B) >= 276-132 = 144.
```

Consequently

```text
x <= 576-2b <= 576-288 = 288.
```

Both inequalities must be equalities if x=288. Thus b=144 and every one
of the 24 vertices in B has global degree 24. Conversely these two
conditions imply x=288 by the same degree sum. This equivalence is within
the hypothetical graph setting and does not assert realizability.

The existing lower bound is obtained independently on A:

```text
18+2a+x = sum_(u in A) d_G(u) >= 18*18,
x >= 306-2a >= 306-170 = 136.
```

This proves the stated two-sided corridor.

## 3. Defect identity and conditional refinements

<a id="claim-cross-upper-defects"></a>

```text
Claim ID: n43/d18/cross_upper_bound.md#claim-cross-upper-defects
Kind: local-deduction
Review state: ready
Scope: every G and every degree-18 v in Section 1
Dependencies: the census b>=144; global degree upper bound 24
Conclusion: 288-x=2(b-144)+sum_B(24-d_G(y)); the refinements below
Search use: none pending independent review; proposed use propagate
Reviews: none
```

Define the nonnegative integer degree deficit

```text
D_B = sum_(y in B) (24-d_G(y)).
```

Substitute sum_B d_G(y)=576-D_B into the exact degree sum:

```text
x = 576-2b-D_B,
288-x = 2(b-144)+D_B.
```

Thus either b>=145 or any total degree deficit in B immediately improves
the upper bound. In particular:

| Additional premise | Upper bound |
| --- | --- |
| b>=145 | x<=286 |
| at least t vertices of B have degree at most 23 | x<=288-t |
| every B vertex has degree at most 23 | x<=264 |
| every G vertex has degree at most 22 | x<=240 |

For the last row, sum_B d_G(y)<=24*22=528, so x<=528-288=240.
None of these extra degree premises is imposed on the whole d18 branch.

The A degree sum also gives the already-indexed bound x<=414-2a.
With q=85-a this becomes

```text
x <= min(288,244+2q).
```

Hence q=0,1,2 give upper bounds 244,246,248 respectively. These are
conditional on the actual neighborhood deficit, without any restriction
on the excess sum E_A. They do not imply that all degree-18 neighborhoods
have q<=2.

## 4. Audit of stronger attempts

Tentative stronger upper bounds (277 and 272) were rejected during the
author's final structural audit and are **withdrawn**. They are not lemmas
or pruning rules. The problematic step tried to extend an independent
triple in B by v and a vertex z in A. But v and z are adjacent, so this
cannot give an independent five-set. Assertions that a size-17 row
forces its vertex to be isolated in A, or that size-16 rows have A-degree
at most one or two, were not established.

This is an ambient-adjacency error, not computational evidence concerning
existence of G. No finite arithmetic case check can repair an unsupported
structural premise. The failed drafts were replaced by this note before
handoff, and no arithmetic verifier for them was retained.

## 5. Self-audit and handoff

The valid proof was checked from both degree sums and from the exact
defect identity. B internal edges are counted twice, A-B edges once, and
v-B edges contribute zero. The complement of B has 276-b edges.
All quantifiers refer to any chosen degree-18 pivot; no minimization or
maximization of a or x is used. A is allowed I4 throughout.

This argument supplies an unconditional bound within the d18 assumptions,
conditional only on the established external Ramsey and census theorems.
It does not prove x<=142, close the x>=143 branch, or decide R(5,5).

Independent review is pending. Another coordinator owns concurrent shared
integration, so this task changes only this new note and its historical
report. Suggested integration after review: make the residual branch
explicitly 143<=x<=288 and link this proof; do not change branch coverage
or promote the withdrawn arguments.
