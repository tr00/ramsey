# A 58-edge floor for K4-saturated degree-18 neighborhoods

Date: 2026-10-22. Author and self-auditor: Main, working alone.

Here **K4-saturated** means K4-free and adding any missing edge creates a K4. It does not mean maximizing neighborhood edges over degree-18 roots. All claims are ready for independent review. No executable pruning change, ambient branch closure, or sharpness claim is made.

## Setting and premises

Let A be a simple graph on 18 vertices with no K4 and no independent five-set, and suppose A is K4-saturated. Write a=e(A). The sole numerical census premise used is that a K4/I4-free graph on 12 vertices has at least26 edges: McKay--Radziszowski (1992), Table1, p.16, as recorded in the [root table](../../../README.md#state-of-the-art). Mantel's theorem and elementary counting supply the other steps.

For a vertex v of degree d, put S=N_A(v), H=V(A)-({v} union S), f=e(A[S]), and c=e(S,H). Then S is triangle-free. Every x in H has an edge inside N_S(x), by saturation of vx. Thus c>=2|H|. For every edge uw of S, its common neighbors in H are independent by K4-freeness, and adjoining v gives an independent set; hence at most three such common H-neighbors exist. Assigning each x in H an edge in its S-signature therefore gives

    |H|<=3f.                                              (1)

These are witnesses to saturation inside A; no B-side interface is assumed.

<a id="claim-saturated-low-degrees"></a>
## 1. Minimum degree is at least five; a degree-five vertex forces 59 edges

Claim ID: n43/d18/saturated_neighborhood_density_floor.md#claim-saturated-low-degrees  
Kind: local-deduction  
Review state: ready  
Scope: the pure setting above  
Dependencies: (1); Mantel; recorded12-vertex (4,4) minimum26  
Conclusion: delta(A)>=5; a vertex of degree5 forces a>=59  
Search use: none pending independent review  
Reviews: none

For d<=4, Mantel and (1) give 17-d<=3floor(d^2/4), false for d=0,1,2,3,4. Thus d>=5. If d=5, then |H|=12, f>=4 and c>=24. H is K4/I4-free: an I4 in H would extend with v to I5. Therefore

    a=d+f+c+e(H)>=5+4+24+26=59.

Consequently a<=58 implies delta(A)>=6.

<a id="claim-saturated-degree-six-surplus"></a>
## 2. Every degree-six vertex sees at least four surplus units

Claim ID: n43/d18/saturated_neighborhood_density_floor.md#claim-saturated-degree-six-surplus  
Kind: local-deduction  
Review state: ready  
Scope: the pure setting with delta(A)>=6; any vertex v with d_A(v)=6  
Dependencies: saturation witnesses and edge capacity three proved above  
Conclusion: sum_(u in N_A(v))(d_A(u)-6)>=4  
Search use: none pending independent review  
Reviews: none

Write t=sum_S(d_A(u)-6), so |S|=6, |H|=11, and

    c=sum_S d_A(u)-6-2f=30+t-2f.

Every H-signature has at least two vertices. The number of incidences beyond two per signature is

    R=c-22=8+t-2f>=0.

From (1), f>=4. Suppose t<=3. Then f<=floor((8+t)/2)<=5.

For u in S put k_u=d_S(u) and e_u=d_A(u)-6>=0. Its H-neighbor count is 5+e_u-k_u. At most3k_u of these H-neighbors can be adjacent to any S-neighbor of u: each incident S-edge has at most three common H-neighbors. Thus u has at least max(0,5+e_u-4k_u) H-neighbors x for which u is isolated in A[N_S(x)].

For an H-signature Q, the graph A[Q] contains an edge. Hence the number of isolated vertices in A[Q] is at most |Q|-2. Counting these isolated incidences in the two directions proves

    sum_(u in S) max(0,5+e_u-4k_u)<=R.                    (2)

If f=4, then sum_S k_u=8. An isolated S-vertex alone contributes at least5 to the left side. If there is no isolated S-vertex, at least four of the six degrees k_u equal1, each contributing at least1. Thus the left side is at least4, whereas R=t<=3.

If f=5, then sum_S k_u=10. Either an isolated vertex contributes at least5, or at least two vertices have degree1, contributing at least2. But R=t-2<=1. Again (2) fails.

Both cases contradict t<=3, proving t>=4. This proof retains isolated incidences separately from incidences witnessing an S-edge; signatures may contain more than two vertices.

<a id="claim-saturated-density-floor"></a>
## 3. The unconditional floor is 58 edges

Claim ID: n43/d18/saturated_neighborhood_density_floor.md#claim-saturated-density-floor  
Kind: local-deduction  
Review state: ready  
Scope: every K4-saturated K4/I5-free graph A on18 vertices  
Dependencies: Claims1 and2; degree incidence; convex square bound  
Conclusion: e(A)>=58  
Search use: none pending independent review  
Reviews: none

Assume a<=57. Claim1 gives delta(A)>=6. Put

    e_z=d_A(z)-6>=0, T=sum_z e_z=2a-108<=6,
    F={z:e_z=0}, J={z:e_z>0}, h=|J|, |F|=18-h.

Thus T is one of0,2,4,6. Claim2 gives, for each v in F, sum_(u adjacent v)e_u>=4. Summing and counting the same weighted cut from J gives

    4(18-h)<=sum_(z in J)e_z*d_F(z)
            <=sum_(z in J)e_z*(6+e_z)
             =6T+sum_J e_z^2.                             (3)

If h=0, Claim2 fails immediately. If h=1, every vertex in F must be adjacent to that single positive-surplus vertex, since it must see positive surplus. But that vertex has degree6+T<=12 and |F|=17, impossible.

For h>=2, positive integral e_z of total T satisfy

    sum_J e_z^2<=(T-h+1)^2+h-1,

by concentrating all but the mandatory one unit at each of h-1 vertices into the remaining vertex. Since 2<=h<=T<=6, (3) is impossible. The exact checks are:

|T|h values|maximum right side of (3), in increasing h order|left side|
|---|---|---|---|
|2|2|14|64|
|4|2,3,4|34,30,28|64,60,56|
|6|2,3,4,5,6|62,54,48,44,42|64,60,56,52,48|

This exhausts every possible T and h, contradicting a<=57. Therefore a>=58.

For an actual degree-18 pivot of an order43 K5/I5-free graph, A=G[N_G(v)] has the required forbidden subgraphs. If it is K4-saturated, the theorem applies unconditionally within that branch, independently of excess, column sizes, connectivity, root count, complementation, or root maximization.

The theorem does not assert that a 58-edge example exists, that every order43 candidate has a saturated degree-18 neighborhood, or that saturating a neighborhood preserves an ambient completion. It raises the recorded pure floor from50 to58 under the explicitly requested saturation hypothesis. The [validation and handoff](../../reports/2026-10-22-saturated-d18-floor.md) records author checks; independent review remains pending.
