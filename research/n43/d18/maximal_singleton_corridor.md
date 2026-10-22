# Singleton columns at a maximum-density degree-18 pivot

Date: 2026-10-22. Author: Main, alone. All new claims are ready for independent review; proposed search use is propagation after review. No branch closure or novelty is claimed.

Let G be K5/I5-free of order 43, with degrees 18..24. Choose v maximizing a=e(G[N(v)]) among its degree-18 vertices. A=N(v), B=M(v). Suppose y in B has N_A(y)={t}.

Dependencies: R(3,4)=9; R(4,4)=18; recorded (4,4,17) regularity and edge count 68; the accepted small-column competition theorem in [69-edge attachment obstructions](a69_attachment_obstructions.md#claim-a69-small-column-degree-competition). No x137/x138 closure is used.

<a id="claim-singleton-corridor"></a>
## 1. Exact corridor and simultaneous core attachments

Claim ID: n43/d18/maximal_singleton_corridor.md#claim-singleton-corridor  
Kind: local-deduction  
Review state: ready  
Scope: the setting above  
Conclusion: 73<=a<=76, epsilon_t<=2a-146; the exact constraints below  
Search use: none pending review  
Reviews: none

The B-neighborhood of y is (4,4)-free, hence has at most17 vertices. Therefore y has degree18 and its B-neighborhood D has order17. Transversality of {t} makes C=A-{t} another (4,4) core of order17. Both cores have 68 edges and degree8. Let Z be the six remaining vertices, excluding v,y,t,C,D. Put

    r=|N_C(t)|=a-68, s=|N_D(t)|, h=|N_Z(t)|, epsilon_t=d_G(t)-18.

The exact degree identity is r+s+h=16+epsilon_t. Maximality at the actual degree-18 destination y says 68+s<=a, so s<=r. Since h<=6,

    r+s>=10+epsilon_t,  r>=5,  10+epsilon_t-r<=s<=r,
    16+epsilon_t-2r<=h<=6,  epsilon_t<=2r-10.

Also r<=8 because N_C(t) is triangle-free and I4-free. Thus 73<=a<=76. Equivalently the pair identity gives a+a_y>=146+epsilon_t. No destination of degree19 is used.

Every z in Z has at least9 neighbors in each of C,D. Indeed an independent triple in C missed by z, together with z and y, would form I5; thus the missed C set is K4/I3-free and has order at most8. Exchange the roots for D. This is a simultaneous two-core attachment restriction, not merely a bound on total x.

<a id="claim-singleton-equality"></a>
## 2. The 73-edge endpoint forces a six-vertex excess reservoir

Claim ID: n43/d18/maximal_singleton_corridor.md#claim-singleton-equality  
Kind: local-deduction  
Review state: ready  
Scope: Claim 1 with a=73  
Dependencies: Claim 1; elementary Mantel theorem  
Conclusion: t has degree18; y is another maximizing root; r=s=5, h=6; E_Z>=18  
Search use: none pending review  
Reviews: none

At r=5 the inequalities force epsilon_t=0, s=5 and h=6. Hence t has degree18, and a_y=73 is a tie. The root t need not be a density tie: maximality only gives a_t<=73 (it is an eligible third root).

Z has no I3, because v,y are a nonadjacent pair anticomplete to Z. Since t is complete to Z, Z has no K4. Thus Z is (4,3)-free of order6. Its complement is triangle-free; Mantel gives e(Z)>=15-9=6. Counting degrees on Z, with the nine-neighbor bounds on each core and all six t attachments, gives

    sum_Z d_G(z)>=108+6+2e(Z)>=126,
    E_Z=sum_Z(d_G(z)-18)>=18.

The six-vertex reservoir therefore has average degree at least21. In particular this endpoint cannot occur with total excess W<18. Equality E_Z=18 forces e(Z)=6, all C- and D-attachments to have size9, and the Mantel equality graph Z=K3 disjoint-union K3. This equality shape is retained; no ambient completion is asserted.

<a id="claim-singleton-small-column-competition"></a>
## 3. A singleton excludes every two-column and concentrates small-column excess

Claim ID: n43/d18/maximal_singleton_corridor.md#claim-singleton-small-column-competition  
Kind: local-deduction  
Review state: ready  
Scope: any degree-18 pivot with a singleton; maximality unnecessary  
Dependencies: accepted small-column competition theorem linked above  
Conclusion: exactly one singleton at most; no two-columns; c=3..8 implies epsilon_z<=c-3 for each other column z  
Search use: none pending review  
Reviews: none

Apply the accepted inequality epsilon_y+epsilon_z<=|C_y|+|C_z|-4 whenever the column sizes sum to less than10. Since epsilon_y=0 and |C_y|=1, a second singleton or a two-column gives a negative upper bound on nonnegative excess. For another column of size c=3..8 the bound is epsilon_z<=c-3. In particular every three-column belongs to a degree-18 vertex and is subject to the selected-root neighborhood cap a. These consequences specialize an existing accepted theorem; they are not claimed as a new pair inequality.

The new reduction is a narrow, coupled-core corridor: every selected root outside 73..76 has all columns of size at least2, and every selected root with a singleton has no two-columns. The lowest endpoint forces a specified zero-excess common neighbor and E_Z>=18. None of this proves that a singleton exists or excludes all graphs in the corridor.
