# Degree-18 cross-count upper-bound investigation

Date: 2026-10-14. Owner: Codex cross-upper-bound task. Base revision:
`49bd3637b8e6763ac6fbd3bd5c267155b0f1cb27`.

The user requested an unconditional upper bound on x in n43/d18 and
authorized exploring all mathematical avenues. Computational exploration
remained paused. No solver, graph enumerator, download, or installation
was used, and no subagents were spawned for this task.

The reliable result is `136<=x<=288` for every degree-18 pivot. The
upper bound was already implicit in the indexed corridor, although the
residual branch displayed only the generic x<=306. Its proof is
`2e(B)+x=sum_B d_G(y)<=576`, combined with the published e(B)>=144.
Equality forces e(B)=144 and all 24 B vertices to have global degree 24.
The exact defect form is
`288-x=2(e(B)-144)+sum_B(24-d_G(y))`.

The same note records the conditional bound
`x<=min(288,244+2q)` for q=85-e(A), directly from the A degree sum.
In particular q=0,1,2 give caps 244,246,248. These are arbitrary-root
claims at fixed q, with no small-excess or regularity assumption.

Tentative stronger bounds announced during exploration were withdrawn
after the final author audit detected an invalid independent-set extension:
v and a vertex z in A are adjacent and cannot jointly extend an independent
triple. No retained pruning rule depends on those arguments.

Proof and handoff:
[cross_upper_bound.md](../n43/d18/cross_upper_bound.md).
SHA-256 of the ready-for-review proof:
`e6aec586624b6370644ba8c75c00836c6dce1ffb720ae3ff4a39e395a46a82e0`.
The proof has an author self-audit only; independent review is pending.
No novelty claim or order-43 nonexistence claim is made.

Validation used an inline Python standard-library arithmetic check over
the stated integer scalar ranges a=50..85, b=144..160, E_A=0..108,
retaining x=306-2a+E_A and a B deficit between zero and 144. Assertions
checked the maximum 288, the exact defect identity, the equality conditions,
and the q=0,1,2 caps. Output:

```text
Exact scalar arithmetic verified: x<=288; equality and defect identity; q=0,1,2 caps 244,246,248.
No graphs enumerated; numerical feasibility is not graph realizability.
```

Only the new proof and this report were edited. Existing concurrent work,
shared indexes, WORK.md, and the Git index were left to their active
coordinator. After independent review, suggested integration is to link
the proof and explicitly cap the residual branch at 288. A proof of
x<=142 or any stronger general cap remains open in this investigation.
