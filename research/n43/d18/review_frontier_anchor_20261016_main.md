# Revised independent-four anchor audit

Date: 2026-10-16. Task: `published-edges-20261016`.

## Claims and exact revisions

- `frontier_band.md#claim-frontier-anchor-defects`, SHA-256
  `0c2642ee587c55cc22192a6f7f97dbe51d32e72a9d0ef43014e8c3535eb7b7be`.
- Revised anchor portion `transfer_bounds.md#claim-band137-anchor-defects`, SHA-256
  `aba6d5141eb8ddcb597690658e15f2e962a34984a5c71f9731c5f2af1239e95d`.
- Frontier specialization in `../../../docs/lemma_phase_2.md`, subsection
  "Independent-4 anchors at the frontier", SHA-256
  `08d76179122a6e7c2f7ef2fddfbdf9bf2c87f7b98af33060a77012ccaf2d2212`.

Revised proof author: `FrontierAnchors`. Independent reviewer: `Main`.
Main also integrated status, citations and the immediate singleton-count corollary.
The hashes include that integration. Earlier reviews retain their original scope.
`FrontierAnchors` independently checked and accepted Main's singleton-count
corollary by peer handoff on 2026-10-16, including its universal anchor scope.

## Dependencies checked

The external numerical premise is Angeltveit and McKay,
[*R(5,5) <= 46*, arXiv:2409.15709v2](https://arxiv.org/html/2409.15709v2#A1.T1),
Appendix A, Table 1: `E(4,5,14)=60`. Main directly inspected this table during
this conversation. This accepts the published census result, not a replay of
its exhaustive computation.

The local dependencies are the degree-18 pivot partition, global degree
floor 18, the definition `q=85-e(A)`, and the singleton-signature argument.
For every independent four-set I in A, each of the 24 B columns meets I.
Each exact singleton class is a clique of at most three vertices: two
nonadjacent members would extend I minus its singleton vertex to I5, and
four mutually adjacent members together with the singleton vertex give K5.
Thus `n1<=12` and `e(I,B)>=36`.

## Independent checks

1. S=A-I has exactly 14 vertices. It is K4-free because A=N(v) is K4-free,
   and I5-free by inheritance from G. It is therefore (4,5)-free. No I4
   prohibition is transferred to S. The published cap60 applies.
2. The independent anchor has no internal edges and exactly four edges to v.
   Consequently `e(I,B)+C=68+E_I` and `e(S)+C=85-q`, where C=e_A(I,S).
3. Combining cap60 with these identities and `e(I,B)>=36` gives exactly
   `25-q<=C<=32+E_I`, `36<=e(I,B)<=43+q+E_I`, and
   `53-q-E_I<=e(S)<=60`. No sign assumption beyond the stated excess
   interpretation is needed for this linear implication.
4. With eta=e(I,B)-36, the unchanged identities are
   `C=32+E_I-eta`, `e(S)=53-q-E_I+eta`, and
   `eta=(12-n1)+h`. Thus `0<=eta<=7+q+E_I`. Each signature of size at
   least three contributes at least one to h, so its count is at most eta.
   Also `n1>=12-eta>=5-q-E_I`, with the additional trivial floor zero.
5. The quantifier is every independent four-set, not a chosen favorable
   anchor. No restriction q<=2 is used. The transfer therefore applies
   at q=3 as well. At x=136 the exact budget forces q=E_I=0 and gives
   C in25..32, cross incidences36..43, core edges53..60, n1>=5 and at
   most seven signatures of size at least three.

Outcome: **accepted** for the revised anchor intervals and their displayed
linear/signature consequences. Permitted search use: propagation on the stated
complete-graph assumptions. No branch is closed.

## Verification and limits

A temporary Lean consumer proved all three general intervals and the eta
bound from a genuine (4,5)-free graph on14 vertices, the two explicitly
assumed counting identities, and the singleton incidence lower bound.
`#print axioms smokeAnchor` reported only `propext`, `Classical.choice`,
`Quot.sound`, and `edges_ramsey_4_5_14_le_60`. The consumer was removed.
This checks the numerical implication, not a permanent formalization of
all graph-level anchor counting and singleton lemmas.

The published input remains trusted. This audit is not a novelty review,
formal exhaustion certificate, census replay, or order-43 exclusion. The
historical sufficient core caps36/42/48 and their exact reviews are unchanged.
