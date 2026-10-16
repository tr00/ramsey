# Published edge extrema and stronger frontier anchors

Date: 2026-10-16. Task token: `published-edges-20261016`.
Coordinator: Main. Premise author: PublishedPremises. Revised anchor author:
FrontierAnchors. Main independently reviewed the revised anchor proof;
FrontierAnchors independently checked Main's additional singleton-count corollary.

## Published inputs integrated

The root README now records the previously omitted exact intervals:

| Graph type | Edge interval | Source |
| --- | --- | --- |
| (4,5,14) | 22..60 | Angeltveit–McKay, arXiv:2409.15709v2, Appendix A, Table 1 |
| (4,4,11) | 19..36 | McKay–Radziszowski 1992, Table 1, p. 16 |
| (4,4,12) | 26..40 | Same |
| (4,4,13) | 33..45 | Same |
| (4,4,16) | 60..60 | Same |
| (4,4,17) | 68..68 | Same |
| (5,4,14) | 31..69 | Complement of (4,5,14) |

The tables in both original sources were directly inspected during the preceding
conversation audit. No graph catalogue was acquired or census replayed.
The README explains complementation and distinguishes blank cells from nonexistence.

`lean/Ramsey/Premises.lean` adds thirteen named trusted axioms: both endpoints
for (4,5,14), the missing lower endpoint for (4,5,17), and both endpoints
for (4,4) orders11,12,13,16,17. All existing exported names remain unchanged.
Source notes now identify every supplied interval and the precise table/page.
No extra (5,4) axiom is needed. These are published premises, not new results.

## Revised local deduction

For every independent four-set I in the degree-18 neighborhood A, put
S=A-I, C=e_A(I,S), q=85-e(A), and E_I=sum_I(d_G(u)-18).
S is (4,5)-free on14 vertices, not necessarily I4-free. The published cap60,
the identities `e(S)+C=85-q`, `e(I,B)+C=68+E_I`, and singleton bound36 give:

```text
25-q<=C<=32+E_I,
36<=e(I,B)<=43+q+E_I,
53-q-E_I<=e(S)<=60,
0<=eta_I=e(I,B)-36<=7+q+E_I.
```

The exact signature identity `eta_I=(12-n1)+h` is unchanged. It also yields
`n1>=max(0,5-q-E_I)` and at most `7+q+E_I` signatures of size at least three.
At x136 these become C in25..32, cross incidences36..43, core edges53..60,
at least five singleton signatures and at most seven larger signatures.

The proof, transfer scope and frontier specialization were updated in
`n43/d18/frontier_band.md`, `n43/d18/transfer_bounds.md`, and
`docs/lemma_phase_2.md`. The reduction index and Lean coverage notes were
updated. Exact proof hashes, dependency checks and permitted propagation are
in the [independent review](../n43/d18/review_frontier_anchor_20261016_main.md).
Earlier review documents, manifests and census-free sufficient-cap proofs
remain unchanged. No new branch closure or novelty claim is made.

## Verification

- `sh lean/scripts/check.sh`: PASS. Toolchain pin, complete build, exact sorry
  ledger, style gate and existing target axiom sets all passed unchanged.
- `lake env lean /tmp/ramsey-published-edges-qtaunt1k/PublishedEdgesSmoke.lean`:
  exit0 after correcting scratch-only complement normalization. The temporary
  consumer applied all new bounds on arbitrary finite types, proved the
  order-14 complement interval31..69, and proved the new general anchor
  intervals and defect cap from the explicitly supplied counting identities.
- `#print axioms smokeAnchor`: `propext`, `Classical.choice`, `Quot.sound`,
  and `edges_ramsey_4_5_14_le_60`, without `sorryAx`.
- The temporary consumer directory was removed. No permanent tests were added.
  The graph-level anchor proof remains reviewed markdown, not a new permanent
  formal theorem. Adding premises did not change the axiom dependencies of
  any previously audited target.

Integration SHA-256:

- README.md: `d866d304dc02d75cab26aace9941bd9dd34a0f82d4b0347817590bb0a26fc78d`.
- lean/Ramsey/Premises.lean:
  `ee0cc21d95decb13390895b7fa999b2a6b6d318e3c50e7231cc21cf230253a38`.

No installation, graph search, staging or commit was performed. Order43 and
the live equality-frontier branch remain open.
