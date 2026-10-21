# Independent audit of large-row attachment reductions

Editorially condensed on 2026-10-21; [original audit and lineage](../../reports/2026-10-21-research-cleanup.md).

Date: 2026-10-17. Reviewer: `LargeRowAudit`. Author: `LargeRowResearch`.
Owned path: this file only.

## Decisive independent checks

The six claims were checked from the ambient K4/I5-free A and K5/I4-free B
without transferring I4-freeness to A. The 17-core is 8-regular and the
codegree saturation proves SRG(17,8,3,4). The three eight-cell moment rows
reproduce (e,n2,sum h,sum C(h,2))=(10,4,44,86),(11,2,42,81),(12,0,40,76).

The seven-clause 17-core attachment criterion and eight-clause adjacent-16-row
system cover every forbidden-set split in both directions. They are joint
criteria, not per-mask realizability guarantees. Two-core balance follows
by subtracting the regular-degree equations. The S10/S11/S12 classification
was checked by its degree-2/C5 and cubic cases; the explicit graphs have
10/11/12 edges and 4/2/0 degree-two vertices.

Ambient lifting preserves all mixed clauses and gives exactly the two stated
families, potentially overlapping. The shortened subset-size arguments in
Claims2/3 require R(3,4)=9 on the complement: alpha<=2 inside a (4,4)-free
core implies order<=8. This completed reasoning, the retracted per-mask
example, and the resolved tail-audit flag are retained in Findings.

## Claim(s) and exact revisions

Source: `n43/d18/large_row_extensions.md`

- Reviewed revision SHA-256
  `1f53107e3e8889c6ee8064e50578de8e092641b60e8b9c3eacfac6d6f2827c48`
  (494 lines). This replaces the originally submitted revision SHA-256
  `f0d6eac70d4f06b9aa7ad4e2d72079d60a577058429ef1bf659729e55748db35`
  (495 lines).
- The sole change between the two revisions is the closing paragraph of
  Claim `#claim-seventeen-codegree-moments` (old lines 94-97, new lines
  94-96): the conditional sentence referring to "a degree-18 ambient
  boundary ... as in the independent row analysis" (retired x287 draft
  context) is replaced by the general statement that the moment
  restrictions apply simultaneously to any two triangle-free eight-subsets
  of H, with no incompatibility of any specified overlap pattern asserted.
  I re-read the full revised file against my complete read of the prior
  revision: no other line differs; the line-count delta is exactly the
  one-sentence replacement. No reference to `287`, to the retired draft,
  or to any x136-tail statement remains; the x136 closure is explicitly
  disclaimed at lines 19-21.

Claims reviewed, each at the reviewed revision above:

1. `#claim-seventeen-codegree-moments`
2. `#claim-seventeen-extension-domain`
3. `#claim-two-seventeen-core-balance`
4. `#claim-common-eight-classification`
5. `#claim-sixteen-signature-reduction`
6. `#claim-large-row-ambient-lifting`

Author and reviewer are distinct; no author self-check is treated as a
review (the author's trailing scalar audit remains a self-check).

## Dependencies reviewed

- `anchored_cell_averaging.md#claim-cell-saturation` — state accepted,
  reviewed by `review_audit_pending_averaging_20261015.md`. Supplies
  8-regularity of the 17-core, degrees 7/8 on 16-vertex rows, degrees
  2/3 on (3,4)-free 8-vertex cells. I re-derived the two facts used here
  directly from R(3,4)=9 and R(3,3)=6 (see checks), so the dependency is
  applicable and its use is narrower than its full statement.
- `averaging_future_work.md#claim-averaging-adjacent-sixteen-rows` — state
  accepted, same review link. Supplies |R_u cap R_w| = 8, |X| = |Y| = 8,
  S = (3,4)-free for adjacent size-16 rows. I re-derived the overlap bound
  (adjacent roots: intersection is triangle-free via K5 through the two
  roots, I4-free via I5 through v, hence <= 8 by R(3,4)=9; pigeonhole
  gives >= 8).
- Ramsey inputs R(4,4)=18, R(3,4)=9, R(3,3)=6 — standard, used only as
  equalities/bounds as stated.
- Scope premise `epsilon in {0,...,6}` (global degree interval 18..24):
  a recorded external branch premise, used in Claim 1's `d_A(u)=epsilon_u<=6`,
  Claim 4's `|C_s| >= 4/5`, `|C_x|` budgets, `d_A(u)=1+epsilon_u`, and
  Claim 5's degree equations. The note states it as retained scope and
  does not re-derive it; I do not re-derive it either. It is independent
  of the x136 closure.
- Census premises are NOT used by any proved claim: the unique-17-core
  census and `E(4,5,18)=85` appear only as explicitly non-acquired
  optional replacements. `q=85-e(A)` and `x` in Claim 5 are declared
  unfixed quantities matching the repository convention (verified against
  `cliques_augmentation.md`, `frontier_band.md`).

## Findings

No correctness defect found in any of the six claims at the reviewed
revision. Two proof steps are compressed in the source to a single
clause that is not valid for general graphs; both become valid using
only the note's declared inputs, and I supply the completed arguments
above (Claims 2 and 3: a subset of a (4,4)-free graph with independence
number at most two has order at most eight, via R(3,4)=9 on its
complement). These are documentation-density issues, not statement
errors; an optional author clarification would help future readers,
but no claim outcome changes.

Coordination note: at `Main`'s request I also independently audited the
new large-row tail arithmetic circulating over hub: the census-free
bound x <= 280 with its t=1 equality exclusion (verified), and the
t=2,x=280 census-based exclusion. In my first pass I flagged one step
of the latter as unproved; that flag is RESOLVED and is not a live
defect: `Main`'s argument gives `t+m_y<=4` at every B-vertex (all t
17-roots, regardless of omission, together with the m_y omitting
16-roots form an independent set of A), so at t=2 every m_y<=2, while
`sum_y m_y = 8s = 48 = 24*2` forces `m_y=2` at all 24 vertices; then
`k_y<=1` (two omitting cores would give k+m=4, an I5), the cores cover
B with |C|=10, each y in X|Y has k+m=3, and the obligation chain
`A<=e(Z,L)<=42-2e(L)<=30` with `e(L)>=6` (Mantel; two disjoint K3 show
6 is sharp at this relaxation) gives `322+2f-A<=336`, `f<=22`,
`b<=124-5+22=141<144`. I rederived each of these lines. Those
statements belong to `Main`'s note, whose own review is owned by
`IndependentCutsAudit` (accepted at `Main`'s final SHA prefix 8cfd);
they are recorded here only to mark the boundary of this review.

## Outcomes

- `#claim-seventeen-codegree-moments` (revised): **accepted**
- `#claim-seventeen-extension-domain`: **accepted**
- `#claim-two-seventeen-core-balance`: **accepted**
- `#claim-common-eight-classification`: **accepted**
- `#claim-sixteen-signature-reduction`: **accepted**
- `#claim-large-row-ambient-lifting`: **accepted**

Permitted search use of the accepted claims: `propagate`, on the stated
scope only.

## Limits

- No branch is closed and no closure is implied; the source asserts no
  novelty, no certificate, and no graph search, and this review supplies
  none. The two finite signature systems and their ambient lifting remain
  open tasks in the source itself.
- The recorded degree interval 18..24, the standard Ramsey numbers, and
  the two accepted input claims were not re-proved here beyond the
  narrow derivations listed above; census data (unique 17-core,
  E(4,5,18)=85) were neither used nor recertified.
- This review checked proofs, quantifiers, splits, and scalar
  arithmetic only. No enumeration, catalogue, solver, build, or Lean
  check was run; acceptance is of the written mathematics at the exact
  SHA-256 recorded above, not a formal verification.
