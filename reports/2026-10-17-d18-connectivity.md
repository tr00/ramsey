# Report: degree-18 neighborhood connectivity classification

Date: 2026-10-17. Task token: `connectivity-d18-20261017`.
Base revision: `d7851e8`. Author: Main (user-directed session); no
independent reviewer was engaged, so all claims remain review state ready.

## Motivation

Planning for the `G[A]` generator (`scripts/geng.sh`) required knowing
whether connected-only generation (`geng -C`) is sound for the degree-18
neighborhood class, and more generally which unconditional, x-independent
constraints `G[A]` satisfies.

## Deliverables

- `n43/d18/neighborhood_connectivity.md`
  SHA-256 `0295220b921f29ec7d8d0b4cbd8074ff2452d74d31b0e955c96eddbab04f965d`

Claims (all local-deduction, review state ready, search use propagate):

1. `claim-connectivity-01`: a disconnected G[A] is exactly K_m disjoint
   union C with m in {1,2,3} and C (4,4)-free on 18-m vertices with
   alpha(C)=3.
2. `claim-connectivity-02`: the corresponding edge slices are
   a in [53,58], a=61, a=68; hence a>=69 (q<=16) forces connectivity,
   including x=136.
3. `claim-connectivity-03`: no recorded unconditional G[A] filter excludes
   the three families (deletion floor vacuous at a<=79); vertexwise
   epsilon/d_B obligations for clique-component vertices, including the
   m=1 boundary trigger; K4-membership obligations for m<=2; and the
   column obligation that a cross column missing a clique vertex meets
   every independent triple of C.

## Premises

External premises retained as recorded, not recertified: R(4,4)=18,
R(3,4)=9, and the published (4,4) census intervals 50..55, 60..60, 68..68
on 15, 16, 17 vertices (root README census table; McKay-Radziszowski 1992
as recorded in lean/Ramsey/Premises.lean). Recorded internal premises used:
row identity and row cap (reductions.md 5.2), r_u=17 boundary trigger,
section 4.5 K4/I4 membership, and the universal column-meets-I4 premise.

## Limits

No novelty review, no literature search beyond the recorded census table,
no graph search, enumeration, solver, download, installation, Git staging,
or commit. No realizability claim for the disconnected families and no
x-value exclusion. Independent review of all three claims is pending.

## Integration handoff

Suggested coordinator action: add to the `n43/d18/README.md` shared proof
notes list:

```markdown
- [Neighborhood connectivity classification](neighborhood_connectivity.md)
```

Generator guidance now recorded in the note: `geng -C` valid only for the
a>=69 slices; the a in [53,58], 61, 68 slices need unrestricted generation
plus the three rigid families.

## Formalization and review continuation

The user subsequently requested review and Lean formalization. The structural
classification and census consequences now compile in
`lean/Ramsey/d18/ConnectivityClassification.lean`, re-exported by `Ramsey`.
The original report above describes the earlier research state.

- Lean source SHA-256:
  `ce54ddab31bc54b5547e79760bc2a417e91ecb98f538c79cc2ae17efb2e3b883`.
- Updated mathematical note SHA-256:
  `6713c9a1fe4224a6559b6b0ce4efe3237b535588a5dc1f4bb3c5a486771f31e6`.
- `Ramsey.d18.connectivity_classification` proves the exact exceptional family
  for every finite eighteen-vertex `(4,5)`-Ramsey graph. It includes connectedness
  of the large component and an independent triple with no independent four-set.
- `disconnected_edge_slices` proves the necessary edge slices `[53,58]`, `61`, `68`.
- The degree-18 wrappers apply to arbitrary finite ambient Ramsey graphs.
  Connectivity for `q<=16` and the order-43 equality-frontier `x=136` is proved.

The proof uses anticomplete cuts instead of enumerating independence profiles.
If both sides are noncomplete, an independent pair on either side excludes an
independent triple on the other. Both sides then have at most eight vertices
by `ramsey_4_3_le_9`, contradicting order eighteen. A nonempty complete side
has order at most three, and its complement is `(4,4)`-free. The same cut
argument proves that a `(4,4)`-free graph of order at least twelve is connected.
Consequently the structural theorem needs only `ramsey_4_3_le_9`, not
`ramsey_4_4_le_18`. The census consequences additionally use the six already
trusted edge bounds for orders fifteen through seventeen. No new axiom or
`sorry` was introduced.

Corrected the generator wording from “valid exactly for a>=69” to a sufficient
condition. In fact connected-only generation is sound outside
`[53,58] union {61,68}`, including some slices below sixty-nine. No member of
the exceptional family is asserted to extend to an order-43 candidate.
The interface/filter claims in claim 03 are outside this formalization.

Verification completed:

- `lake env lean Ramsey/d18/ConnectivityClassification.lean` passed without warnings.
- `lake build` passed. Existing unrelated warnings and deliberate sorries remain.
- A temporary importing consumer passed, exercising the equivalence, extraction
  of an independent triple, connectivity at sixty edges, `q<=16` and `x=136`.
  The consumer and temporary counting draft were removed.
- `lake env lean scripts/Audit.lean` reported no `sorryAx` for any new audited target.
- `sh lean/scripts/check.sh` passed build, unchanged sorry ledger, style and exact
  axiom expectations. New targets are included in the permanent axiom audit.

No graph search, solver, catalogue, download, installation, staging or commit.

## Independent review

Claims: `n43/d18/neighborhood_connectivity.md#claim-connectivity-01` and
`#claim-connectivity-02`. Original author: Main. Independent reviewer:
`ConnectivityAudit` (read-only reviewer agent). Outcome: accepted on the recorded
premises. Claim 03 received only a spot-check and retains review state ready.

Reviewed mathematical-note snapshot SHA-256:
`6713c9a1fe4224a6559b6b0ce4efe3237b535588a5dc1f4bb3c5a486771f31e6`.
Post-review metadata and dependency-link integration SHA-256:
`125007bb8e179ff0fa741eeb926dc1a8cfad4c5d72a07eddfcc3cd919204df77`.
The claim statements and proof bodies were unchanged by that integration.

Checks: independence additivity, all positive component-independence partitions
of four, the K4-free clique-size bound, the symmetry implicit in using
`R(3,4)=9` for K4/I3, connectedness and exact independence number of the large
component, census directions, edge arithmetic, deficit equivalence and frontier
applicability. The reviewer confirmed the necessary qualification to the original
“exactly a>=69” generator wording. It also found a broken claim-03 dependency
link, corrected to `../reductions.md`. The four-singleton profile actually has
at most twelve vertices, which satisfies the displayed looser bound fourteen.

Limits: the published premises were not independently recertified. No
realizability or novelty conclusion was made. No exhaustive claim-03 filter
survey was performed. Formal verification covers claims 01 and 02 and the
explicit connectivity corollaries, not all interface obligations.

The degree-18 branch README now links the mathematical note and Lean proof.
No theory-map update or new branch-closure claim was made.
