# Saturation coverage and the external-blocker alternative

Date: 2026-10-22. Author: Main, alone. Claims are ready for independent review; no branch is closed. This note distinguishes global K5-saturation from K4-saturation of a degree18 neighborhood.

Let R(s,t,n) denote graphs of order n with no K_s or I_t. A K_r-free graph is K_r-saturated if every added missing edge creates a K_r. Equivalently, every nonedge has a K_(r-2) in its common neighborhood. This single-edge characterization is the accepted [safe augmentation theorem](../../foundations/safe_augmentation.md#claim-safe-augmentation-01).

<a id="claim-global-saturation-coverage"></a>
## 1. Global saturation is a complete reduction

Claim ID: n43/d18/saturation_coverage.md#claim-global-saturation-coverage  
Kind: local-deduction  
Review state: ready  
Scope: any n,s,t with s>=3,t>=2  
Dependencies: finite edge augmentation; adding edges cannot create independent sets  
Conclusion: R(s,t,n) is nonempty iff it has a K_s-saturated member  
Search use: none pending review; proposed existence coverage  
Reviews: none

Given G in R(s,t,n), choose a supergraph H on the same vertex set with as many edges as possible subject to having no K_s. The finite family contains G. Every missing edge of H creates K_s by maximality, and H has no I_t because it contains G. Conversely a saturated member is a member. Thus

    no K5-saturated graph in R(5,5,43)
        implies R(5,5,43) is empty.

This theorem concerns the entire graph. Its augmentation may increase every original degree18 vertex's degree; it does not preserve the degree18 branch.

<a id="claim-rooted-saturation-blocker-cover"></a>
## 2. A complete degree18 reduction retains external blockers

Claim ID: n43/d18/saturation_coverage.md#claim-rooted-saturation-blocker-cover  
Kind: local-deduction  
Review state: ready  
Scope: any rooted G in R(5,5,43) with d_G(v)=18, A=N_G(v), B=M_G(v)  
Dependencies: finite augmentation inside A; single-edge characterization  
Conclusion: G has a Ramsey supergraph H preserving all edges outside A and preserving N(v), in which every A-nonedge has an internal K4 witness or one of the two external triangle witnesses below  
Search use: none pending review; proposed complete structural branching  
Reviews: none

Among supergraphs obtained by adding only edges within A, choose H maximizing e(H[A]) while retaining no K5. Adding edges preserves I5-freeness. All pivot edges are fixed, so d_H(v)=18, N_H(v)=A, and |B|=24. Every remaining nonedge uw in A creates K5 when added, so H[N_H(u) intersect N_H(w)] contains a triangle T.

If T contains v, its other two vertices lie in A and form an edge, so adding uw makes K4 inside H[A]. If H[A] is not K4-saturated, choose a nonedge uw with no edge in its common A-neighborhood. Its witness T cannot contain v, and cannot contain two A vertices, since those two would be an edge in that common A-neighborhood. Therefore this nonedge is blocked by exactly one of these witness location types:

    (a) T={a,b,c}, a in A, b,c in B;
        all triangle edges and all six edges from {u,w} to T exist;
    (b) T={b,c,d} subset B;
        all triangle edges and all six edges from {u,w} to T exist.

The internal nonedge is locally safe but globally unsafe. The normalized rooted graphs consequently admit a complete disjoint property split:

    H[A] is K4-saturated;
    H[A] is not K4-saturated and has an external-blocked locally safe nonedge.

Witness types may overlap and are not a disjoint witness partition. Excluding both property branches would exclude all degree18-rooted candidates. Excluding only the first leaves the second branch. Excluding the entire degree18 branch still leaves graphs with no degree18 vertex unless a separate root-occurrence or coverage theorem applies.

No claim here says that an arbitrary isolated saturation of A preserves its ambient extension. Every augmentation used above is checked against global K5-freeness, retaining external blockers.

<a id="claim-local-saturation-counterexample"></a>
## 3. Global saturation need not saturate a prescribed degree class's neighborhoods

Claim ID: n43/d18/saturation_coverage.md#claim-local-saturation-counterexample  
Kind: local-deduction  
Review state: ready  
Scope: an explicit order8 analogue; no existence assertion at order43  
Dependencies: elementary cycle independence; explicit witness graph  
Conclusion: a K5-saturated K5/I5-free graph can have every degree5 neighborhood non-K4-saturated  
Search use: none; refutes the general transfer principle  
Reviews: none

Let F be the complement of C7, and let H=K1 join F. The cycle C7 has independence number3, while deleting any cycle edge leaves P7 with independence number4. Therefore F is K4-free and every added F-nonedge creates K4. H is accordingly K5-free and K5-saturated: every H-nonedge is an F-nonedge, and its new K4 joins the universal vertex. Also alpha(H)=alpha(F)=2, so H has no I5.

The universal vertex has degree7. Each of the seven cycle vertices has degree5 in H. At every such vertex u, its neighborhood is K1 join P4: the four F-neighbors induce the complement of P4, which is again P4. The two endpoints of that path have no common path neighbor; adding their missing edge makes a cycle C4, whose join with K1 still has no K4. Thus none of the degree5 neighborhoods is K4-saturated, although the whole graph is K5-saturated.

This example does not settle the special degree18/order43 transfer. It shows why that transfer needs an additional proof rather than following from ordinary maximal-supergraph selection.

The [58-edge floor](saturated_neighborhood_density_floor.md#claim-saturated-density-floor) applies to the first rooted property branch only. The requested implication from absence of locally saturated degree18 neighborhoods to absence of all order43 graphs would require excluding the external-blocker branch and covering graphs without degree18 vertices. Neither is established here.
