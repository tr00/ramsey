# Common definitions and notation

This file is the shared notation reference for the repository. Use these
symbols in new and revised mathematical notes, and link here instead of
introducing a competing convention. State the ambient graph and all additional
hypotheses at each application. Definitions here do not supply proof premises;
the [reduction index](../research/n43/reductions.md) records bounds and their status.

Existing reviewed proofs, dated reports, and source code retain their local
notation. The aliases below explain how to read them without changing reviewed
statements or hashes. When revising such a file, use the canonical symbols;
changes to mathematical statements still follow the
[review workflow](workflow.md).

## Graphs and Ramsey notation

All graphs are finite, simple, and undirected.

| Symbol | Meaning |
| --- | --- |
| `G`, `H` | Ambient graph; another graph or an explicitly specified induced graph |
| `V(G)`, `E(G)` | Vertex set and edge set |
| `n` | Order `|V(G)|`; order-43 specialization must be stated |
| `G[S]` | Subgraph induced by `S subset V(G)` |
| `G-S` | `G[V(G) - S]` |
| `bar G` | Complement of `G` on the same vertex set |
| `e(H)` | Number of edges of the graph `H` |
| `e_G(S,T)` | Number of edges between disjoint vertex sets `S,T` |
| `N_G(u)` | Open neighborhood; it excludes `u` |
| `M_G(u)` | Open antineighborhood `V(G) - (N_G(u) union {u})` |
| `N_S(u)`, `d_S(u)` | `N_G(u) intersect S` and its cardinality |
| `d_G(u)` | Degree of `u` in `G` |
| `delta(G)`, `Delta(G)` | Minimum and maximum degree |
| `omega(G)`, `alpha(G)` | Maximum clique size and maximum independent-set size |
| `K_t`, `I_t` | Complete graph and edgeless graph on `t` vertices |
| `mathcal K_t(H)`, `mathcal I_t(H)` | Families of vertex subsets inducing `K_t` and `I_t` in `H` |
| `R(s,t,n)` | Graphs of order `n` with no `K_s` and no `I_t` |
| `R(s,t)` | Least `n` such that `R(s,t,n)` is empty |
| `e(s,t,n)`, `E(s,t,n)` | Minimum and maximum edge counts over the nonempty family `R(s,t,n)` |
| `binom(n,t)` | Number of `t`-element subsets of an `n`-element set |

`(s,t)-free` and `K_s/I_t-free` both mean no `K_s` and no `I_t`.
Write `e(G[S])`, rather than `e(S)`, when the ambient graph could be ambiguous.
An extremum of an empty Ramsey family is undefined here.

Use `mathcal K_t(H)` for a family of cliques: existing `K4(F)` and `K_t(H)`
sometimes denote that family rather than a graph. Similarly, existing
`I_k(H)` and `#I4(H)` mean `mathcal I_k(H)` and `|mathcal I_4(H)|`.

## Pivot and cross interface

Fix a rooted graph `(G,v)` with `G in R(5,5,n)`.

| Symbol | Definition |
| --- | --- |
| `A` | `N_G(v)` |
| `B` | `M_G(v)` |
| `d` | `d_G(v)=|A|` |
| `b0` | `|B|=n-1-d` |
| `a` | `e(G[A])` |
| `b` | `e(G[B])`; always an edge count, not the order of `B` |
| `x` | `e_G(A,B)` |
| `F` | `bar(G[A])`, the complement on `A` |
| `R_u`, `r_u` | Row signature `N_B(u)` and its size, for `u in A` |
| `C_y`, `c_y` | Column signature `N_A(y)` and its size, for `y in B` |
| `s_u`, `t_y` | Internal degrees `d_A(u)` and `d_B(y)` |
| `X_(u,y)` | Cross-adjacency entry: 1 if `uy` is an edge, 0 otherwise |

Rows are indexed by `A`, columns by `B`. Different vertices may have identical
signatures; columns form an indexed collection, not necessarily a set of
distinct subsets. The accounting identities are

```text
e(G) = d+a+b+x,
x = sum_(u in A) r_u = sum_(y in B) c_y,
d_G(u) = 1+s_u+r_u       (u in A),
d_G(y) = t_y+c_y         (y in B).
```

The induced types are `G[A] in R(4,5,d)` and `G[B] in R(5,4,b0)`.
In particular, `A` may contain independent four-sets. Use `u,w,z` for
vertices in new interface notes, reserving the scalar `x` for cross edges.
For multiple pivots attach subscripts: `A_v,B_v,a_v,b_v,x_v,F_v`.

## Degree-18 budgets at order 43

This section assumes `G in R(5,5,43)` and `d_G(v)=18`, so `|A|=18`
and `|B|=24`. The nonnegative budgets use the established degree floor 18
and neighborhood edge cap 85 cited in the reduction index.

| Symbol | Definition |
| --- | --- |
| `epsilon_z` | `d_G(z)-18`, for any `z in V(G)` |
| `E_S` | `sum_(z in S) epsilon_z` |
| `E_A`, `E_B` | Excess sums on the two pivot sides |
| `W` | `E_V(G)`, total degree excess |
| `q` | `85-a`, neighborhood edge deficit |
| `k` | `x-136`, offset from the original equality frontier |
| `n_j` | Number of vertices of global degree `j` |
| `m_i(v)` | Number of neighbors of `v` of degree `18+i`, `0<=i<=6` |

```text
W = E_A+E_B,
e(G) = 387+W/2,
x = 136+2q+E_A,
k = 2q+E_A,
b = 148+W/2-q-E_A,
e(F) = 68+q,
r_u = 17+epsilon_u-s_u.
```

For several degree-18 pivots use `q_v` and `E_(A_v)`; the latter is
traditionally written `E_v`. Existing `E` and `Delta_A` in degree-18 notes
mean `E_A`. Existing `q_85` means `q`. Some degree-excess tables use `n_i`
for the number of vertices of degree `18+i`; translate this to `n_(18+i)`.
Do not confuse `E_A` with an edge maximum `E(s,t,n)` or the edge set `E(G)`.
The historical `x=136` profile is excluded; its notation remains useful for
reading the [frontier proofs](../research/n43/d18/x136/README.md).

## Columns, anchors, and transversals

| Symbol | Meaning |
| --- | --- |
| `L_j` | `{y in B : c_y=j}` |
| `ell_j` | `|L_j|` |
| `H_6` | `sum_(y in B : c_y>=6)(c_y-6)` |
| `mathcal H` | A family of subsets of a stated ground set |
| `T` | A transversal: a subset of the ground set meeting every member of `mathcal H` |
| `tau(mathcal H)` | Minimum cardinality of a transversal; 0 for an empty family |
| `tau_4` | `tau(mathcal I_4(G[A])) = tau(mathcal K_4(F))` |
| `J`, `Q` | An explicitly chosen independent anchor and clique anchor |
| `S_y(J)` | Anchor signature `C_y intersect J` |
| `lambda_J` | Weight assigned to an actual anchor `J` |
| `mu_u` | Anchor load `sum_(J containing u) lambda_J` |
| `w(S)` | `sum_(u in S) w(u)` for explicitly given vertex weights |

Every column is a transversal of `mathcal I_4(G[A])`; hence
`tau_4<=c_y` and `|B|*tau_4<=x`. Stronger transversal bounds require the
hypotheses of their source proofs. Existing `tau_4(F)` has the same meaning
when `F=bar(G[A])`.

The small-column notes use `r=ell_4`, `s=ell_5`, and `H=H_6`. When every
column has size at least four, their budget reads

```text
x = 144-2ell_4-ell_5+H_6,
2ell_4+ell_5 = 8-k+H_6.
```

Folder names such as `r2` retain this convention: exactly two size-four
columns. Use `ell_4,ell_5,H_6` in new text to avoid collisions with Ramsey
parameters, internal row degrees, and graphs named `H`.

## Overlap, cells, and symmetry

| Symbol | Meaning |
| --- | --- |
| `c_G(u,w)` | Ambient codegree `|N_G(u) intersect N_G(w)|` for distinct vertices |
| `bar c_G(u,w)` | Common-nonneighbor count `|M_G(u) intersect M_G(w)|` |
| `Gamma_D(Q,P)` | `{z in D-(Q union P) : Q subset N_G(z), P subset M_G(z)}` |
| `kappa(H)` | Vertex connectivity of `H`, with the convention stated in the source theorem |
| `Aut(H)` | Automorphism group of `H` |
| `Sym(S)`, `S_m` | Permutation group of the set `S`, or of an `m`-element set |
| `C2` | Cyclic group of order two, including the complement action when specified |
| `Stab_K(Z)` | Stabilizer of the entire specified state `Z` under group `K` |

Existing `c(u,w)` and `lambda_uw` mean ambient codegree, whereas `c_y`
always means a column size. Define cell anchors, ambient domain, and required
adjacencies explicitly; cell letters such as `S,T,U` are local. If `Q` is a
clique and `P` is independent, the cell inherits the corresponding reduced
Ramsey constraints from the stated ambient graph.

For a fixed pivot and fixed internal graphs, `Aut(G[A]) x Aut(G[B])`
acts on the whole cross matrix. A stabilizer of a partial state and a
stabilizer of a completed graph are different objects; specify the state.

## Other scopes and notation collisions

In order-43 global counting, write `eta_z=d_G(z)-21`,
`D_21=sum_z eta_z`, and `V_21=sum_z eta_z^2`. Existing reduction-index
symbols `delta_z,Delta,V` denote these quantities, respectively; this
`Delta` is not maximum degree. Other moment symbols must be defined locally.

Abstract theorems may use arbitrary Ramsey parameters or generic edge caps.
State their substitution into the pivot notation explicitly; their local
`q`, for example, need not mean `85-a`. Code identifiers, catalogue record
indices, Boolean variable numbers, and branch/task tokens keep their declared
formats and are not mathematical aliases for `x`.
