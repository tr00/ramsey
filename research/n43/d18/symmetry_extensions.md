# Stronger degree-18 symmetry bounds

Integration status (2026-10-19): all three claims below are independently
accepted on their stated premises by
[the review](review_symmetry_extensions_20261019_extension_rigor.md) at
reviewed SHA-256
`1f4115db83f8ac1b1f0f21a80213f9fef17076e3b43bfb3a76b3a76d06067497`.
The author-stage "ready" prose below is preserved so the reviewed text stays
byte-identical apart from this banner and the claim metadata lines. The
review records editorial findings; no proof body was changed.

Date: 2026-10-15. Task: symmetry-extensions-20261015. Author: Codex.

These are extensions of the accepted [symmetry note](symmetry_reduction.md),
with related general group arguments in
[symmetry quotients](../../../docs/general_theorems/symmetry_quotients.md).
All three claims are **ready for independent review**; the checks below
are the author's own. No accepted claim is replaced, no branch is closed,
and no new pruning is authorized before independent review. No graph
enumeration, solver, canonicalizer, package, download or literature review
was used. No novelty or measured runtime claim is made.

## Setting

Let G have order 43 and contain neither K5 nor I5. Fix any degree-18
vertex v, A=N(v), B=M(v), |A|=18, |B|=24, C_y=N(y) intersect A.
A is (4,5)-free and may contain I4; B is (5,4)-free and cannot contain I4.
For a signature C, let B_C={y in B:C_y=C}, m_C=|B_C|,
U=A minus C, c=|C|, omega_C=omega(A[C]), alpha_U=alpha(A[U]).
Set omega(empty)=alpha(empty)=0 and R(1,t)=R(t,1)=1.

Where degree budgets are used, retain the established degrees 18..24
and the recorded census e(A)<=85, e(B)<=160. Write

```text
epsilon_u=d_G(u)-18, E=sum_A epsilon_u,
q=85-e(A), x=136+k, k=2q+E,
W=sum_V epsilon_u=2e(B)-296+2q+2E <=24+2q+2E.
```

W is even. For Claim 03 also use

```text
z=|{u in A:epsilon_u>0}|,
z<=E,
n_d=|{u in V(G):d_G(u)=d}|.
```

<a id="claim-d18-symmetry-extensions-01"></a>
## 1. Actual signature subgraphs give a general multiplicity bound

Claim ID: `research/n43/d18/symmetry_extensions.md#claim-d18-symmetry-extensions-01`

Kind: local-deduction

Review state: accepted

Scope: general K_p/I_q-free rooted gluing, p,q>=3, arbitrary pivot
degree and actual repeated column C; then the order-43 degree-18 setting.

Dependencies: the homogeneous-set argument below, equivalent to
[signature-anchor Claim 01](../../../docs/general_theorems/signature_anchors.md#claim-signature-anchors-01);
R(3,3)=6, R(3,4)=9, R(4,3)=9 and R(3,5)=14 for the numerical
specialization.

Conclusion: in general let A be (p-1,q)-free, B be (p,q-1)-free and
write omega_C=omega(A[C]), alpha_U=alpha(A[A minus C]). Then B_C is

```text
(p-omega_C, min(q-1,q-alpha_U))-free,
m_C <= R(p-omega_C,min(q-1,q-alpha_U))-1.
```

Consequently **every** degree-18 candidate, regardless of x or q,
satisfies m_C<=5 for every C. If m_C>=3, exactly one of these cases holds:

```text
(i) c<=4: C is independent, B_C is a clique, 3<=m_C<=4.
(ii) c>=5 and B_C has an edge:
     10<=c<=13, omega_C=2, alpha_U=2, B_C is (3,3)-free.
(iii) c>=5 and B_C has no edge:
      m_C=3, U is a clique, 15<=c<=18.
```

In case (ii) with m_C=5, B_C is C5. Cases (i) and (iii) are retained;
no assertion of their impossibility or realizability is made.

This bounds the full residual kernel for every degree-18 candidate:

```text
|K_M|=product_C m_C! <= (5!)^4 * 4! = 4,976,640,000,
24!/|K_M| >= 124,672,148,625,024.
```

Proof of the general bound: Any clique of p-omega_C vertices in B_C
is completely joined to a maximum clique in A[C] and gives a K_p.
This includes omega_C=0, when the obstruction is wholly in B.
Likewise an independent set of q-alpha_U vertices in B_C can be
combined with a maximum independent set in A[U] to give an I_q.
B additionally contains no I_(q-1), including when U is empty.
The two inherited maximum homogeneous-set sizes in A guarantee
p-omega_C>=2 and q-alpha_U>=1, so all parameters are legitimate.
Applying the Ramsey definition proves the general bound. If the
independence parameter is one, B_C is empty.

For degree 18, a size-at-most-four signature has |U|>=14. Since
U inherits no K4, R(4,3)=9 guarantees alpha_U>=3, making any two
occurrences adjacent. Since A has no I5, c>=5 implies omega_C>=2;
then B_C has no K3 and no I4, so m_C<=8 by R(3,4)=9. Signatures
with c<=4 have m_C<=4 from forced adjacency and B's K5 prohibition.
Thus any hypothetical m_C>=6 must have c>=5 and B_C triangle-free.
A triangle-free graph on at least six vertices contains an I3 by
R(3,3)=6. Three independent occurrences have the same uncovered
set U, which must contain no I2; hence U is a clique. Since A has
no K4, |U|<=3 and c>=15. Also six occurrences in B, which has
no I4, cannot themselves be independent, so some two are adjacent.
Their common signature C must be triangle-free, since a triangle
there extends that edge to K5. But C also inherits no I5, so
c<=13 by R(3,5)=14. This contradicts c>=15 and proves m_C<=5.
For (i), U has an I3, so B_C is a clique; a three-clique forces C
independent, and B's K5 prohibition bounds its size by four. For
c>=5, C contains an edge, so B_C is triangle-free and three or
more occurrences contain a nonedge. This gives alpha_U<=2 and
c>=10. If B_C also has an edge, C has no triangle and c<=13;
thus |U|>=5, U is not a clique, and alpha_U=2. This proves (ii).
If B_C is independent, B's I4 prohibition gives m_C=3; the uncovered
U is a clique, hence has at most three vertices. This is (iii).
These cases exhaust all possibilities.

Finally a (3,3)-free graph on five vertices is C5: each neighborhood
is independent of size at most two, so every degree is at most two;
each nonneighborhood is a clique of size at most two, so every degree
is at least two. A simple 2-regular graph on five vertices is C5.

Finally maximize product m_C! over positive integers m_C<=5 summing
to 24. If 1<=a<=b<5, transfer one from a to b; the product changes
by the factor (b+1)/a>1 (delete the zero part when a=1).
Thus a maximizing partition has at most one part below five, and
must be 5+5+5+5+4. This gives the displayed kernel and label counts.
These are universal upper/lower bounds, not realizability statements.

Search use: multiplicity propagation and kernel-size bounds after review.

Reviews: [independent review](review_symmetry_extensions_20261019_extension_rigor.md).

<a id="claim-d18-symmetry-extensions-02"></a>
## 2. Exact duplicate-kernel reduction applies throughout x136..141

Claim ID: `research/n43/d18/symmetry_extensions.md#claim-d18-symmetry-extensions-02`

Kind: local-deduction

Review state: accepted

Scope: the degree-18 frontier band 136<=x<=141 on the existing
four-transversal and small-column premises; any full B edge vector.

Dependencies: accepted [symmetry Claim 03](symmetry_reduction.md#claim-d18-symmetry-03);
general [quotient Claims 01 and 02](../../../docs/general_theorems/symmetry_quotients.md).

Conclusion: throughout this band K_M=(C2)^p with p<=12, and its
exact least full B edge vector is obtained by at most C(24,2)=276
2-CNF feasibility questions on p variables. This handles every
combination of duplicate swaps. It is valid even when a duplicate
pair is nonadjacent, as allowed for a size-ten pair at x140,141.
Minimizing the resulting kernel representatives over lifts of H_M
gives the exact Gamma_M minimum by general Claim 01.

Proof: The accepted band claim bounds each m_C by two. Thus each
nontrivial factor is one swap on a disjoint pair of occurrences.
The general algorithm needs only those swaps, with no assumption
about the pair's internal bit. That bit is fixed by its own swap.
Apply the two general quotient claims. These statements quotient
the actual completion vector and do not impose twin-neighborhood
equations. No bound on the cost of the H_M stage is asserted.

Search use: exact kernel symmetry after independent review and implementation.

Reviews: [independent review](review_symmetry_extensions_20261019_extension_rigor.md).

<a id="claim-d18-symmetry-extensions-03"></a>
## 3. A sharper complement selector, including its equality case

Claim ID: `research/n43/d18/symmetry_extensions.md#claim-d18-symmetry-extensions-03`

Kind: local-deduction

Review state: accepted

Scope: every degree-18 root with the stated global degree and census
budgets; no transversal premise or complement normalization assumed.

Dependencies: exact degree budgets in the setting, W even; the
project's sorted-degree complement selector. The strict special case
extends [accepted symmetry Claim 06](symmetry_reduction.md#claim-d18-symmetry-06).

Conclusion: if q+E+2z<48 then n18>n24. If q+E+2z<=48, the
sorted degree sequences satisfy D<lex D^c. At equality, a failure
of n18>n24 forces exactly

```text
n18=n24=19-z,
n19=4+2z,
n20=1,
n21=n22=n23=0,
W=120-4z,
q+E+2z=48.
```

In particular 3E+q=3k-5q<=48 suffices for D<lex D^c, giving
automatic complement compatibility throughout 136<=x<=152.
This is not an upper bound on x, and the equality case allows
n18=n24. The actual z version can apply much further than the
E-only version if excess is concentrated on fewer neighbors.

Proof: The root and its 18-z degree-18 neighbors give n18>=19-z.
Suppose n18<=n24=m. There are 43-n18 vertices of positive excess;
each contributes at least one to W and each of the m degree-24
vertices contributes another five. Therefore

```text
W >=43-n18+5m >=43+4m.
```

As W is even, W>=44+4m>=120-4z. Combining with
W<=24+2q+2E gives q+E+2z>=48, proving the strict assertion.

If q+E+2z=48, the upper and lower bounds coincide. Necessarily
m=19-z and n18=m: if m were larger, 44+4m would exceed W;
if n18 were smaller, it would violate n18>=19-z. The baseline
excess of m degree-24 vertices, m degree-18 vertices, and every
other vertex of degree19 is 43+4m=119-4z. The actual W is exactly
one larger. Thus exactly one of those other vertices has degree20
and the remainder have degree19. The displayed profile follows.
Its n19=4+2z is positive, so after the outer-degree tie the next
comparison n19-n23 is positive and D<lex D^c. If instead
n18>n24 at equality, the outer comparison already selects D.

Since z<=E, q+3E<=48 implies q+E+2z<=48. The identity
k=2q+E gives q+3E=3k-5q. For k<=16 and q>=0 this is at most
48. At x152 the only endpoint not covered by the older strict
inequality is q=0,E=16. Any outer-degree tie then forces z=16
and the particular profile

```text
18^3,19^36,20^1,24^3.
```

No existence of that degree profile or Ramsey graph is asserted.
For example the local data q=0,E=18,z=3 have q+E+2z=24, while
3E+q=54; the improved criterion would apply to any actual root
with those data, although the old criterion would not. Such
necessary numerical data are not a graph construction.

Search use: complement compatibility and degree-count propagation after
independent review, on exactly the retained census and degree premises.

Reviews: [independent review](review_symmetry_extensions_20261019_extension_rigor.md).

## Author checks and provenance

Multiplicity was checked against both clique and independent-set
extensions, including empty C,U and the inherited I4 prohibition
on B. The factorial bound maximizes over all partitions, without
assuming its extremal partition is realizable. The kernel algorithm
does not use forced adjacency. The selector was rederived with the
actual number z of positive neighbors and its equality profile;
the equality conclusion deliberately concerns D, not strict n18>n24.

Input revision: `f98a1285b7adc9720a693ae3a54fba212a021bdf`.
Exact input SHA-256:

| Input | SHA-256 |
| --- | --- |
| symmetry_reduction.md | `6b9072c4a9b1f54042bd6d7e4913d4aedd5b0a8e8c04a2d18b994c2dc2d31d1b` |
| frontier_band.md | `0b8eaa6bd7ca0c6ea8691409112754ab2f0d4b2730166ff4d843b5b807269a54` |
| x136/small_columns.md | `f542dc5f73640d4d9b9da8790638dfd2d546feed79c5d8633d2ed3155f680733` |
| ../reductions.md | `b64a7aec9950ec483e124fda44356a23ae35e913be89a7dfba131a0be76a62ba` |

Self-audit withdrew an overstrong draft assertion that every triple
necessarily lies in case (ii). An independent triple permits case
(iii), and a small independent signature permits case (i). The final
statement deliberately retains both. Existing numerical census sources
and their limits remain as recorded
in the accepted notes. These proofs need independent review before
the theory map or accepted reduction index is updated. No order-43
decision, completion search, certificate or literature novelty follows.
