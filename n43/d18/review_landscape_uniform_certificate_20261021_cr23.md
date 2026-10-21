# Independent review of the uniform transversal certificate

Claim: [claim-landscape-uniform-certificate](parameter_landscape.md#claim-landscape-uniform-certificate), only.

Author: Main. Reviewer: independent subagent `/root/claim_review_23` (`cr23`), 2026-10-21.

Reviewed revision: worktree based on commit `3eebcca5e627fdc3df5f26fd2a1925a7c121153f`; exact source SHA-256 `6d0af226c0723b698ec5fa033776f216b7953ba4885bf93fba59de21bc6164ca`.

Outcome: **accepted**, on the recorded external Ramsey and census premises. This outcome covers the necessary conditions (3)–(7), their contrapositive anchor implication, and their pure internal-degree version. It does not review the numerical parameter map or the other four claims as separate conclusions.

## Decisive independent checks

- A transversal L leaves a K4/I4-free core H. For each vertex of L, its neighbors in H are K3/I4-free, giving at most eight neighbors by R(3,4)=9. This uses the I4 prohibition only in H, not in A. For a chosen u in L, deleting u leaves at most `U(18-ell)+8(ell-1)+floor((ell-1)^2/3)` edges. Subtracting from `85-q` proves the generic member floor D. The sharper four-member floor also holds for arbitrary transversals: the referenced proof uses only the core and the three other transversal vertices, with no actual-column or zero-excess assumption. Its triangle case bounds pair intersections by three and the triple intersection by zero, giving the required deletion cap 76.
- In the full pivot, `w=d-epsilon<=d<=13` and the degree sum gives `sum_A w=170-2q-E`. Bounding L by t gives (3). Summing the core edge cap, its cut cap `8ell`, and the K4-free bound on L gives (4).
- Put `E_L=sum_L epsilon`. Nonnegativity and the per-vertex cap give `E_L<=min(E,6ell)=B_ell`; consequently `sum_L d<=t ell+B_ell`. The complement of A[L] is K5-free, so its Turan upper bound yields `e(A[L])>=b4(ell)`. In the exact deletion identity `e(H)=85-q-sum_L d+e(A[L])`, both signs now give precisely (5). Each vertex in L needs excess at least `max(0,D-t)` and at most six; summation and the individual cap prove both parts of (6).
- For `3<=m<=9`, `U(m)=floor(m^2/3)`. Equality in (5) squeezes the deletion identity between equal bounds: the core has U(m) edges, the L degree sum is `t ell+B_ell`, and L has `b4(ell)` edges. Turan equality identifies H as balanced complete three-partite. Its cut is the L degree sum minus twice the L edge count, giving the left side of (7). Independently checking the attachment lemma: an outside vertex cannot meet all three parts; maximal degree M requires both complete parts complementary to a smallest part. Two vertices of that type cannot be adjacent because their common neighborhood contains an edge. Such independent vertices together with their omitted c-set give at most `4-c` vertices per type. All other vertices have degree at most M-1. Summing proves the stated C bound and hence (7).
- Empty L cannot be a transversal, since R(4,4)=18 and A is K4-free. Thus enumerating ell=1..18 covers every possible transversal; rejection of all sizes gives an I4 disjoint from L. Integer weights then give the floor t+1. Passing tests provide only necessary numerical conditions. At ell=18 the empty-core cap is zero and the proof still applies; the equality attachment test is invoked only for m=3..9.
- In the pure version, replace w by d and use the degree sum `170-2q`. Setting the certificate budget E to zero bounds `sum_L d` directly by `t ell`; it does not impose an ambient actual-pivot excess condition. Condition (6) becomes the valid member-floor restriction `D<=t` for nonempty L. All deletion and equality steps remain valid without G or B.

## Dependency revisions and limits

The premise ledger and attachment proof are in the reviewed source bytes above. Supporting files inspected have these exact SHA-256 hashes:

| Dependency | SHA-256 |
| --- | --- |
| [four-column stability](four_column_stability.md), claim 01 proof | `71fa0ce84eeffff7b7a22790b5d3ce394a9767881269658060f076c13baa902a` |
| [smaller core caps](x136/five_column_compatibility.md), claim core-caps | `ceac4b53cb09c94ec9b2dd850208c865f0bab12c9b203b7a3de51b7a26acbf88` |
| [frontier ledger](frontier_band.md) | `4034a88807d5588943b3ad487574d35c8b23e11472ec0436f913b703e56db134` |
| [row bounds](independent_row_cuts.md), setting and claim degree-cuts | `553b70258b1ce63672d651ae8142ac013b9fb68347f24d372af9cbb922ff306f` |
| [mathematical baseline](../../docs/mathematical_baseline.md) | `de981cede9200a6d61fe7c113734bec5f1b2446d904ec5f16d42afa18a5dc7c0` |
| [root table](../../README.md), recorded census bounds | `c7c87fcd814879ad9a15a5a7137d152f55d5edf366cd4aca847b4c692075eaf0` |

The published U(11..17) values and smaller Ramsey numbers are retained as external premises, without downloading or recertifying their sources. The U(10)=31 premise was inspected in its complementary-triple argument; this review does not replace its existing standalone audit. No reproduction script or JSON map was run or certified, and no realizability, branch closure, novelty, or formal certification follows. No solver, prover, canonicalizer, download, or graph search was used. The source's pending-review search-use metadata was left unchanged for coordinator integration.
