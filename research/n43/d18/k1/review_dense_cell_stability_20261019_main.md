# Independent review of dense-cell local stability

Date: 2026-10-19. Author: CoreSignatureTheory. Reviewer: Main, a distinct
identity. Task: `k1-whole-branch-obstruction-20261019`.

## Claims and exact revision

All three claims in [dense_cell_stability.md](dense_cell_stability.md):
`claim-local-dense-slack`, `claim-seven-cell-local-degree`, and
`claim-fifteen-edge-complement-shapes`.

Reviewed SHA-256:
`d077f32c6a49b68105eedefb3abe93b3d74236ec97f58e154f1195ed59064383`.
The full 244-line manuscript was read and its argument independently
rederived. The statement is conditional on the exterior and density
premises below; their author is Main, so this review is not their
independent audit. Their acceptance requires ExteriorCapacityAudit.

## Dependencies and applicability

- Accepted double-core partition, `research.json`, SHA-256
  `bf434421efcf08b73813866ba8db7e76878700fb65104895539622d8127a069e`.
- Accepted packing, `cross_core.json`, SHA-256
  `772a3df44e76627408b7933cbb46c51a86368f74dde484665e54a14bfd7bd19d`.
- Explicit conditional premise: [critical_core_exterior.md](../critical_core_exterior.md),
  SHA-256 `8b8b1101af98e4c6dfe76234e95510bc6b24fcc32887189aac67d481a2dc2f51`.
  It makes every missed T row triangle-free and I3-free, of size at most four.
- Explicit conditional premise: [triangle_capacity.md](triangle_capacity.md),
  SHA-256 `35107639650ce2719ffa43d251dbf41d837f7f152ddc2a58fff608edd2ff53a8`.
  It supplies the nonnegative density slack and h<=15.
- The global degree ceiling24 applies individually to all T vertices.
  Neither root contributes a T neighbor. Both facts are essential in the
  total-deficit cancellation.

The complement F is only the graph on T. It is not the complement of the
full G or of a core. The manuscript keeps these ambient types distinct.

## Independent derivation

### Claim 1: localized slack

The nine listed row types exhaust sizes0..4 under the (3,3)-free row
premise. For each type alpha=e(F[R])-|R|+2 is nonnegative and every degree
in that same row is at most1+alpha. This is a pointwise bound; it does
not charge independent copies of alpha to multiple vertices at once.

The exact global count is

    sum alpha + sum beta
      =3(21-h)-(119-a)+34 = a-22-3h = B_K.

For a fixed t_i the count of F-edges through t_i missed in the core is

    3d_F(t_i)-sum_incident beta
      =sum_(x in U_i) d_(F[R_x])(t_i)
      <=w_i+sum_(x in U_i) alpha_x.

These two partial defect sums are disjoint subfamilies of the global
nonnegative budget. Therefore w_i>=3d_F(t_i)-B_K. No assumption that the
same budget can be spent independently at all i is made.

### Claim 2: global cancellation

Adding the two core bounds gives w_i^C+w_i^D>=6d_F(t_i)-B, where
B=B_C+B_D. The actual full degree is

    d_G(t_i)=40-d_F(t_i)-w_i^C-w_i^D
            <=40-7d_F(t_i)+B.

Thus its nonnegative deficit from24 is at least7d_F(t_i)-16-B.
Independently summing all seven T deficits gives124-8h-B. Each individual
deficit is at most that sum because all other deficits are nonnegative.
Combining cancels the same B and yields7d_F(t_i)+8h<=140. Constants40,
124 and140, and both signs of B, were independently recomputed.

The endpoint consequences follow by integer division: at h15 the maximum
F degree is2; at h14 it is4; at h13 it is5. Since d_T=6-d_F, the stated
minimum degrees4,2,1 follow. An isolated T vertex needs h<=12.

### Claim 3: six complete analytic residual shapes

At h15, F has7 vertices,6 edges and maximum degree2. Each component is a
path or cycle. Exactly one component is a path, because paths contribute
one and cycles zero to |V|-e. With no cycle it is P7; with one cycle it
is C_j+P_(7-j) for j3..6; with two cycles it must be C3+C3+P1.
This proves completeness of precisely the six listed shapes, without a
scan or a claim that any shape extends to the full graph.

## Exercised verification

Python3.12.3 in Eval with a30-second deadline checked all nine fixed row
types' alpha and degree bounds, and the integer endpoint divisions.
Each of the six explicitly listed F shapes was constructed as a fixed
seven-vertex template and checked to have7 vertices,6 edges and maximum
degree2. Its complement had15 edges, minimum degree at least4, noK5 and
noI4. This confirms only the T-only conditions, not core attachment or
full-graph realizability. No enumeration over seven-vertex graphs,
solver, catalogue scan, download, build, test, lint or formatter was used.

## Outcome and limits

Outcome: **accepted conditional deduction** for all three claims at the
exact hash above, subject to the stated exterior/density premises. No
findings require correction. Independent acceptance of those premises
is a separate gate; if they are accepted unchanged, no additional proof
change is needed for this conditional audit to apply.

Permitted use then is necessary local-degree propagation and the complete
six-shape h15 residual partition. No shape is closed here; K1 and order43
remain open. This is not novelty review, a formal certificate or a
recertification of the external Ramsey inputs.
