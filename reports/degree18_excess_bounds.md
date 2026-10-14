# Conditional degree-excess bounds report

Date: 2026-10-14. Mathematical deductions with exact arithmetic verification;
no graph enumeration, solver, catalogue downloads, installations, or novelty
review. These are internally audited deductions, not an order-43 exclusion.

Let W=sum_z(d(z)-18), let h be the number of vertices of degree above 18,
and E_v the total excess adjacent to a degree-18 root. The published
neighborhood edge bounds give E_v+q_v<=W/2+4.

Proved a cut obstruction: if every degree-18 root satisfies q_v>=Q, each
has at most t=h-ceil((W/2-4+Q)/6) higher-degree neighbors. The higher-degree
vertices require at least 18h+W-2floor(3h^2/8) edges back to the 43-h roots.
This cannot exceed (43-h)min(h,18,t).

Consequently, at exact h=2,4,6,8,10, the respective W upper bounds are
8,20,32,44,58, and every degree-18 root has E_v at most 8,14,20,26,33.
If every such neighborhood has at most 84 edges, at h=2,4,6 the W bounds
sharpen to 6,18,30 and the all-root E bounds to 6,12,18. Conversely, the
profiles (h,W)=(2,8),(4,20),(6,32) force an 85-edge root neighborhood.

Separately, weighted and unweighted cut averages select a root with small E.
At exact h=0,1,2,3,4,5,6, some degree-18 root has E at most
0,0,4,6,12,18,18. At h=4 with no 85-edge root, optimizing the excess
sum of squares improves the selected-root bound to ten. Root selection by
minimum E does not also guarantee maximum neighborhood edges.

Small h gives low-overlap adjacent degree-18 roots independently of W:
for h=0,1,2,3,4,5 the uniform overlap bounds are 9,9,9,10,11,12.
This part additionally uses the published (4,5,17) maximum of 79 edges.

The proofs were audited by counting the cut from both sides, checking that
Turan is applied to K5-free induced graphs or complements, and checking the
integer rounding and quantifiers. Exact arithmetic checked the excluded W
values 10,12; 22,24; 34,36; 46,48; 60 at Q=0 and the additional values
8;20;32 at Q=1. For reproduction, for each of these exact h,Q pairs loop
through even W in [h,6h], set t=h-ceil((W/2-4+Q)/6), and compare the two
sides of the cut inequality. The overlap maxima are the maxima over the
36 integers q=0,...,35 in the displayed formula in the detailed proof.
No inference uses a failed graph search. No hypothesis that h is small has
been established for the general degree-18 branch.

Next avenue: substitute the actual excess multiplicities for the bound six
on omitted excess, then tighten the allowed induced graph on the h vertices.
The detailed proof already formalizes the first step: if S_m is the sum of
the m smallest positive excesses, a root of deficit q can have at most
max{m<=min(h,18):S_m<=W/2+4-q} higher-degree neighbors. Sum these capacities
over roots and compare with the necessary cut size. These inequalities
strengthen degree-profile filters without claiming simultaneous realization.

Detailed proof: `docs/degree18_excess_bounds.md`.
Operational index: `results.md`, Section 8.12.
