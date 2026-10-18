# Edge-maximality pruning of the B-catalogue: analogue falsification

Date: 2026-10-18. Task token: CatalogueMaximality. Question posed by the user:
is it sufficient to check only edge-maximal G[B] in the v+A+B degree-18
decomposition, given the complete B-side catalogue?

## Result

No. The reduction is a WLOG normalization, not a necessary condition, and the
underlying transfer principle ("if any extension exists at B, one exists at an
edge-maximal completion") is false in both direct analogues:

- (3,5)/13 (pivot degree 4, |B|=8, B (3,4)-free): every valid graph is
  4-regular and has e(M(v))=10 at every pivot; no 10-edge (3,4)-graph on 8
  vertices is edge-maximal (degree sequence forced to (3,3,3,3,2,2,2,2), so
  common-neighbor incidences 16 < 18 non-edges); the only edge-maximal class
  has e=12. Valid graphs exist (R(3,5)=14; C13(1,5); 48 labeled graphs
  assembled by row/column gluing). A maximality-pruned search would falsely
  certify R(3,5)<=13.
- (4,4)/17 (pivot degree 8, |B|=8, B (4,3)-free): e(M(v))=e(N(v))+4 in
  {14,15,16} at every pivot; the unique K4-saturated (4,3)-graph has e=22.
  Paley-17 witnesses existence. A maximality-pruned search would falsely
  certify R(4,4)<=17.

For order 43 itself the transfer stays open; the filter must not carry pruning
authority without a proof. Measured coverage loss on the local catalogue:
10421 edge-maximal members span e(B) in [144,157]; all 905 members with
e(B) in {158,159,160} are nonmaximal, inside the recorded live x136 range
148<=b<=160.

## Artifacts

- `n43/d18/catalogue_edge_maximality.md` — three claims (two local-deduction,
  one design), review state draft.
- `scripts/verify_maximality_analogues.py` — deterministic stdlib verification;
  `python3 scripts/verify_maximality_analogues.py` → 12/12 PASS in ~3 s.
- Read-only reuse of `data/r45_24/b24_metrics.tsv` and
  `reports/2026-10-17-b24-catalogue-filter.json`; maximal-member edge range via
  `awk -F'\t' 'NR>1 && $7==0{c[$2]++} END{...}' data/r45_24/b24_metrics.tsv`.

## Provenance

External premises: R(3,3)=6, R(3,4)=9, R(3,5)=14, R(4,4)=18, and the census
completeness premises already recorded in the branch. No downloads,
installs, solvers, catalogue edits, index or theory-map changes; no commit.
Handoff: coordinator may link the note from `n43/d18/README.md` shared notes
and the reduction index after independent review. No branch closure claimed.
