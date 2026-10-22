# Independent proof review: fixed-B extensions, mask occupancy, capacity certificates

Editorially condensed on 2026-10-21; [original audit and lineage](../../reports/2026-10-21-research-cleanup.md).

Claim(s): `research/n43/d18/fixed_b_extensions.md` — all nine anchors:
`#claim-fixed-b-outer-cover` (lines 48–78), `#claim-fixed-b-exact-extension`
(80–155), `#claim-fixed-b-symmetry` (156–201), `#claim-fixed-b-forced-pairs`
(202–254), `#claim-fixed-b-mixed-occupancy` (255–309),
`#claim-fixed-b-small-row-capacities` (310–353), `#claim-fixed-b-mask-balls`
(354–446), `#claim-fixed-b-rational-capacity` (447–526),
`#claim-fixed-b-finite-relaxation` (527–604), plus the Limits (605–629) and
Author audit evidence (630–642) sections.

Author: FixedBResearch. Reviewer: FixedBAudit (independent; author self-audit
is not acceptance).

Reviewed revision: SHA-256
`570a467d13425643b16a829ff116e2634bef91d839a9b65e417529fa0b6ee56f`
(exact uncommitted file, 642 lines, 32129 bytes, mtime 2026-10-17 20:43:15).
Hash confirmed before and during review; the file did not change while I
worked. No project build, formatter, linter, test suite, solver, graph search,
canonicalizer, or graph-file download was run. Only the note, its cited
in-repo dependencies, and the catalogue landing page HTML were read.

Dependencies reviewed:

* `../reductions.md` §5.1–§5.4: the exact forbidden-rectangle criterion
  (all-one rectangle for clique splits, all-zero for independent splits)
  matches (E1)–(E5) term for term; §5.2 single-row bounds
  `d-18 <= s_u <= 13`, `17-s_u <= r_u <= min(17,23-s_u)` are exactly the
  rearranged (E6) row interval at pivot degree 18; §5.3 column bounds match
  `max(1,18-t_y) <= c_y <= min(14,24-t_y)`; §5.4 pair bounds give
  `|R_u∩R_z| <= 8` for edges and `|B-(R_u∪R_z)| <= 13` for nonedges, i.e.
  the strict thresholds 9 and 10 used throughout the note; §8.1 records
  `50 <= a <= 85` and `144 <= b <= 160` as [PUBLISHED]. Applicability holds.
* `symmetry_reduction.md#claim-d18-symmetry-01` (accepted): the A-first
  two-stage quotient with exact sequence `1 -> ∏ S_(m_C) -> Gamma -> H -> 1`.
  Claim 3 is its literal B-first mirror; I rederived the mirror independently
  rather than trusting the swap.
* `anchored_cell_averaging.md#claim-cell-types` (accepted): cited only for
  homogeneous-extension proof style; Claim 5 rederives every table entry from
  first principles (below), so the review does not lean on that file.
* `cell_obligation_cuts.md#claim-cell-signed-cut` (accepted, per
  `review_cell_obligation_cuts_20261015_intersections.md`): rational signed
  aggregation; Claim 8's aggregation was re-proved independently here.
* Classical values used: R(3,3)=6, R(3,4)=9, R(3,5)=14 and symmetric
  R(5,3)=14, R(4,4)=18, R(k,2)=k — all standard.
* External premises (retained, NOT recertified): `R(4,5)=25`; edge extrema
  `50<=a<=85`, `144<=b<=160` (reductions §8.1 [PUBLISHED]); the Ramsey(4,5,24)
  census completeness. I read the McKay landing-page HTML section “Extremal
  Ramsey(4,5)-graphs”: it states verbatim 350904 found in 1995, remainder in
  2016, 352366 altogether, and that no Ramsey(4,5)-graphs exceed 24 vertices.
  The citation is accurate; the completeness assertion itself remains an
  external premise, exactly as the note declares. No graph file (r45_24.g6
  or otherwise) was accessed.

## Decisive independent checks

All nine claims were independently rederived. The outer cover is conditional
on the published B24 census. Five-set splits prove exact extension in both
directions; (E1)--(E5) give sufficiency, and redundant (E6) budgets rely on
the declared degree/extremal premises. Multiset symmetry uses whole A-edge
vectors and transports repeated row occurrences together.

The forced-pair thresholds are intersection>=9 and union<=10. Multiplicity
is at most two, with no repeats at sizes9/10. All twenty mixed-cell caps
were recomputed. Independent-row union minima 11/20/24 and the small-row
capacities count occurrences, including repetitions. Exchange balls use
separate deletion/addition radii; at radius(1,1), capacity2 holds at center
sizes7,8,11..16, so eight such balls cannot cover eighteen rows.

Signed rational aggregation has nonnegative multipliers and rejects only
at strict capacity failure H<18*rho. Support exclusions need
p_R+p_S<=1, not n_R+n_S<=2. Occupancy/rational stages are necessary
relaxations; only the binary edge stage is exact. Passing a relaxation or
failing to find a rational certificate proves no completion.

Findings: no defect requiring correction. One non-blocking observation:
E6 necessity rides on declared external premises; sufficiency is (E1)-(E5).
This is disclosed in the source metadata
itself, so no change is requested.

Outcome (claim-by-claim):

| Claim | Anchor | Outcome |
| --- | --- | --- |
| 1 outer cover | `#claim-fixed-b-outer-cover` | accepted (conditional on external census premise, retained) |
| 2 exact extension | `#claim-fixed-b-exact-extension` | accepted |
| 3 multiset symmetry | `#claim-fixed-b-symmetry` | accepted |
| 4 forced pairs / multiplicity | `#claim-fixed-b-forced-pairs` | accepted |
| 5 mixed occupancy | `#claim-fixed-b-mixed-occupancy` | accepted |
| 6 small-row capacities | `#claim-fixed-b-small-row-capacities` | accepted |
| 7 exchange balls | `#claim-fixed-b-mask-balls` | accepted |
| 8 rational capacity | `#claim-fixed-b-rational-capacity` | accepted |
| 9 finite relaxation | `#claim-fixed-b-finite-relaxation` | accepted (kind: design; exactness boundary accepted as stated) |

Overall outcome: accepted, as mathematics, at the reviewed hash.

Limits:

* External premises retained, not recertified: census completeness of the
  352366 Ramsey(4,5,24) family (landing page read 2026-10-17; quote verified,
  completeness asserted externally, graph files untouched); edge extrema
  50<=a<=85 and 144<=b<=160; R(4,5)=25. A change in any of these puts the
  affected claims back into review.
* This review certifies proof validity only: no realizability, no enumeration,
  no branch closure, no pruning authority beyond the stated necessary
  conditions, no novelty check. Claims remain "ready", not accepted by the
  author side; acceptance here does not close any branch.
* Search use as labeled in the note is permitted: Claim 1 branch-conditional
  on the census premise; Claims 2-8 propagate after this review; Claim 9
  stays design-only until implementation is separately reviewed.
* Unrelated to this file: Main's separate tail-bound deductions
  (superseding drafts around x<=282/280/279) do not appear in this note and
  are owned by other reviews; nothing here depends on them, and they were
  not used in this review.
