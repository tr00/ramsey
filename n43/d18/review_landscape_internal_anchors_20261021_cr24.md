# Independent review of the internal-degree anchor curve

Claim: [claim-landscape-internal-anchors](parameter_landscape.md#claim-landscape-internal-anchors), only.
Author: Main. Independent reviewer: `/root/claim_review_24` (`cr24`). Date: 2026-10-21.
Outcome: **accepted**, relative to the explicitly recorded Ramsey and published edge-bound premises.

## Exact reviewed inputs

Checkout base: `3eebcca5e627fdc3df5f26fd2a1925a7c121153f`. The exact current file hashes below, rather than that commit alone, identify this review:

| File | SHA-256 |
| --- | --- |
| `parameter_landscape.md` (claim and local Claims 1–2) | `6d0af226c0723b698ec5fa033776f216b7953ba4885bf93fba59de21bc6164ca` |
| `parameter_landscape.json` (floor-table comparison) | `1659d4c9fc1137b30a4ca515def814ea3279deee6dc0c35dfac74f30258bde67` |
| `../../reports/2026-10-18-parameter-landscape.json` (retained author reproduction, inspected but not executed) | `d1b159fd73ae7cc8f891587f53b1e20aa29c5788b0391d0e37fdf50161a70620` |
| `../../README.md` (published U-table ledger) | `c7c87fcd814879ad9a15a5a7137d152f55d5edf366cd4aca847b4c692075eaf0` |
| `x136/five_column_compatibility.md` (accepted core-cap claim) | `ceac4b53cb09c94ec9b2dd850208c865f0bab12c9b203b7a3de51b7a26acbf88` |
| `four_column_stability.md` (four-transversal floor argument, not required by the independent certificate below) | `71fa0ce84eeffff7b7a22790b5d3ce394a9767881269658060f076c13baa902a` |
| `frontier_band.md` (accepted anchor-defect identity) | `4034a88807d5588943b3ad487574d35c8b23e11472ec0436f913b703e56db134` |
| `../../docs/mathematical_baseline.md` (ambient types and Ramsey premises) | `de981cede9200a6d61fe7c113734bec5f1b2446d904ec5f16d42afa18a5dc7c0` |

## Decisive independent checks

For a pure K4/I5-free A of order 18, internal degrees satisfy d<=13 because each neighborhood is K3/I5-free. If L={d<=h-1} meets every I4, its complement H is K4/I4-free; this prohibition is justified by transversality, and is not imposed on A itself. Each L vertex has at most eight H neighbors by R(3,4)=9. Independently counting degrees, total edges, and deleted edges gives respectively (3), (4), and (5) with zero certificate budget. Zero here asserts only sum_L d<=(h-1)|L|; no full-pivot excess hypothesis is used.

I evaluated these three inequalities afresh with Python integer arithmetic, using the displayed U-table and b4(s)=r*C(a+1,2)+(4-r)*C(a,2), where s=4a+r. For every q=0..16, h was taken from the claim's table, and every s=1..18 was tested. In the equality case of (5) with 3<=18-s<=9 I independently applied the balanced-core attachment cap (2). All **306** pairs were excluded. In the order degree summation, total-edge bound, deletion bound, equality cut, the first-exclusion counts were **143, 20, 142, 1**, with **zero survivors**. This independently verifies every positive floor without using the individual transversal-member degree floor (6), including its strengthened size-four term.

The single required equality exclusion is q=1, h=8, s=9. Deletion gives e(H)>=27=U(9); equality also gives e(A[L])=6 and sum_L d=63. Turan equality identifies H=K333 and the cut has 63-12=51 edges. An outside vertex has at most six H neighbors. A six-neighbor vertex occupies two entire parts; vertices omitting a fixed part are independent, since adjacent vertices sharing an edge in H create K4. Together with that omitted independent three-part, two such vertices would create I5. Thus each of three types occurs at most once, and nine outside vertices have at most 5*9+3=48 cut edges. This contradicts 51.

For the source's separate q=1 explanation, fresh arithmetic gave exactly the stated deletion bounds [50,44,38,32,27,22,17] and caps [45,40,36,31,27,21,16] for s=5..11. Its invocation of the size-four member floor is mathematically sound: the cited proof uses only that the removed four-set is a transversal, although its older metadata is scoped to actual columns. The independent 306-case certificate above avoids needing that extension.

An empty low set already leaves an I4 by R(4,4)=18, so omission of s=0 from the integer checks is valid. For q=17..35 the claim's h=0 follows directly from the same Ramsey premise. Failure of every proposed transversal size gives an I4 entirely outside L, which is precisely four internal degrees at least h; it does not require all vertices of A to have that degree.

Finally, in the full pivot setting eta_I=32-sum_I(d-epsilon) implies
sum_I(d-h)+eta_I=32-4h+E_I by direct cancellation. At h=8 both summands on the left are nonnegative, giving the stated defect budget. The anchor construction used only pure A, so the lack of an E_A restriction and the q=1 x=138..246 arithmetic are correct.

## Limits and handoff

This review accepts only the named claim, not the other landscape claims or the full effective-degree map. Local Claims 1–2 were checked only to the extent needed above. Published U(11..17), the accepted U(10)=31 argument, and the smaller Ramsey numbers remain explicit external or previously reviewed premises; no catalogues, solver, prover, canonicalizer, downloads, candidate search, or formal certification were used. The finite check is trivial arithmetic validation of necessary inequalities. Neither realizability, optimality, novelty, nor any Ramsey branch closure follows from it.

Source and shared metadata were not edited. The coordinator can attach this review to the exact hashed claim revision; changed proof bytes require renewed review.
