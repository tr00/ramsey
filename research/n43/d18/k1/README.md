# Degree-18 isolated-neighbor branch K1

State: **open**. Parent: [degree-18 pivot](../../README.md).
Scope: a K5/I5-free graph G of order43, a chosen degree-18 root v,
and an isolated vertex u in G[N(v)]. No root-maximization or global
minimum-degree normalization is imposed.

The accepted [double-core reduction](research.json) gives an edge uv,
two disjoint critical17 cores C,D, and a common seven-cell T. Both cores
are SRG(17,8,3,4); both C+T and D+T are K5/I4-free. The remaining
C-D matrix has289 edge bits, with the exact11 obstruction families in
that reduction. None of the new restrictions proves that every such
matrix is impossible.

## Current independently reviewed restrictions

Write p=e(C,T), q=e(D,T), r=e(C,D), h=e(T), F=complement(G[T]).
The [whole-branch research report](../../../reports/2026-10-19-k1-whole-branch-obstruction.md)
records exact proof/review hashes, validation and limits.

- [Critical-core exterior](../critical_core_exterior.md): every core
  vertex has at most four exterior nonneighbors, inducing a triangle-free,
  I3-free graph. Thus every C/D vertex has at least three T-neighbors.
- [Seven-cell capacity](triangle_capacity.md): p,q>=22+3h,
  6<=h<=15, and T has at most two connected components. The h=5,16,17,18
  bands and every three-component T are excluded across all cross counts.
- [Signature geometry](signature_geometry.md): p,q>=65 and exact
  near-minimal incidence/edge slack budgets. The former p=64 layer is
  excluded on either side, independently of the C-D matrix.
- [Mixed-core moments](mixed_core_obstruction.md): 91<=r<=182 and four
  degree-moment inequalities, including 4r+p,4r+q<=795 and
  6r+p,6r+q<=1169.
- [Dense-cell stability](dense_cell_stability.md):
  7d_F(t)+8h<=140 for every t. At h=15 the complete complement-shape list
  is P7, C3+P4, C4+P3, C5+P2, C6+P1, and2C3+P1. These are unresolved
  cases, not certified feasible graphs.

Direct substitution in the accepted identities gives E_C,E_D>=3,
W=sum_G(d_G-18)>=32 and e(G)>=403. The two specified roots have
x_v,x_u>=173. These are K1-specific consequences, not new lower bounds
for an arbitrary degree-18 root in another branch.

## Existing exact reductions and retained relaxation

- [Double-core structure and exact289-bit partition](research.json).
- [Earlier scalar and matrix filters](cross_core.json).
- [Exact seven-cell attachment criteria](seven_cell.json).
- [Original research report](../../../reports/2026-10-19-d18k1-research.json).

The older scalar envelope (p,q>=64 and5<=h<=18) remains a valid weaker
relaxation, not the current complete set of necessary conditions. Its
original proofs and recorded hashes are preserved. The new aggregate
bounds leave a nonempty scalar envelope; scalar feasibility does not
establish an attachment or a43-vertex construction.

No solver/catalogue scan or new Lean/engine implementation was run for
these theorems. Existing catalogue first-witness coverage obligations
and full completion/certification requirements remain unchanged.
