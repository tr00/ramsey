# Independent review of two-root symmetry gluing: original revision

Date: 2026-10-15. Review task: `audit_pair_gluing`.

Claim(s): [pair gluing](symmetry_pair_gluing.md),
`claim-pair-gluing-01`, `claim-pair-gluing-02`, and
`claim-pair-gluing-03`; the order-43 application table was also checked.

Author and reviewer: Codex, task `symmetry-hour-20261015`; independent
reviewer `/root/audit_pair_gluing` (distinct agent, not the author or an
author self-check).

Reviewed revision: exact uncommitted file SHA-256
`9d57200109c45fcaca71167f209781a4f3a10fd5b8de8a79459396c9b796391b`.
Working HEAD when this revision was read:
`249f50a0d2f0e71e4ed6556252eb99ad3e8ed4f4`.
The author subsequently changed the proof; this review remains about the
original bytes and must not be cited as acceptance of the replacement.

## Dependencies and provenance

The group arguments were rederived directly from permutations and graph
isomorphisms. No group-theory assertion was accepted from an author
self-check. The application dependencies read have these exact hashes:

| File | SHA-256 |
| --- | --- |
| `n43/min-degree20/pair_coverage.md` | `dcc49b82fd216c9db70de88d0d8f0dc33e25a82c0eb75e671d47542d4c30cbde` |
| `n43/d18/dense_pivot_coverage.md` | `e64d608ff25049f90b46ceb5775b76dcb0354fbb510a0479d0efaca619c1cd7a` |
| `docs/mathematical_baseline.md` | `e6ea1c070e32ac04a73eb53a5634921acb7fe6d02123a3c7d35a710f262a698e` |

The pair-selection theorems are retained as explicitly stated mathematical
dependencies. Their prescribed-family hypotheses and numerical substitutions
were checked independently for use in this note; their classical Ramsey
premises were not recertified. They are unnecessary for Claims 01--03.
The project instructions, workflow, reproducibility policy, ownership table,
and required degree-18 starting notes were read before this review.

## Scope failure: incompatible fixed overlap colors

The original setting defines `I` as all graph isomorphisms between the
overlaps, identifies `Aut(S)` as graph automorphisms, and subsequently allows
fixed vertex colors or branch data in the side automorphism groups. These
conditions do not ensure that identifying two overlap vertices gives them a
consistent fixed color.

For an explicit mathematical counterexample, let each pointed neighborhood
be a three-vertex star: its distinguished root has two leaves, one red and
one blue. Use the same root color on both sides. Each overlap is the edgeless
red/blue pair. The color-preserving pointed side groups are trivial, so
`J_u=J_v=1`. The displayed uncolored overlap isomorphism set contains both
the color-matching map and the color-swapping map, and
`J_v \ Aut(S) / J_u` therefore has two classes. Only the first map defines a
consistently colored glued skeleton. The swapping map identifies red on one
side with blue on the other. Including colors in `A` and `B` does not remove
that map from `I`.

Transporting color assignments under a side relabeling does not repair this
example: such transport preserves which colored vertex is being identified.
One must either restrict the theorem to uncolored graphs, or define `I` and
`Aut(S)` to preserve the same fixed overlap data. Nonlocal fixed relations
also require their actual enriched-skeleton stabilizer; an arbitrary branch
annotation cannot be inserted silently while retaining the same full group.

## Claim-by-claim findings

| Claim | Outcome at the original hash | Reason |
| --- | --- | --- |
| 01 | changes-requested | Uncolored double-coset argument is valid; fixed-color generality admits incompatible maps in `I`. |
| 02 | changes-requested | Fiber-product formula is valid for a well-defined compatible skeleton; its stated scope inherits the incompatible-map setting. |
| 03 | changes-requested | Staged coverage is valid after compatible-data input coverage is specified; it depends on Claims 01--02 at the flawed setting. |

**Claim 01, supporting independent reasoning.** In the uncolored setting,
an isomorphism fixing the ordered roots preserves the two neighborhoods
separately. Restricting it to them gives `a in A`, `b in B`, and consistency
on their actual intersection gives
`phi'=rho_v(b) phi rho_u(a)^(-1)`. Conversely this equation makes the two
side maps descend to one permutation of the glued union preserving every
fixed incidence. Thus map orbits and rooted skeleton isomorphism coincide.
If `phi_0` is an overlap isomorphism, composition expresses every overlap
map uniquely as `phi_0 h`, with `h in Aut(S_u)`. Conjugating the right-side
restriction image through `phi_0` gives the action `h -> j_v h j_u^(-1)`.
Its orbits are exactly the stated double cosets. The same proof applies to
colored graphs only when the entire isomorphism torsor is color compatible.

**Claim 02, supporting independent reasoning.** A root-fixing permutation
preserves the four incidence cells `S,X,Y,D`. On the two pointed
neighborhoods it induces a pair satisfying
`rho_v(b)=phi rho_u(a) phi^(-1)`. On a uniform, otherwise unstructured `D`
cell it induces an independent arbitrary permutation. Conversely every
such choice acts on the partial graph, so its full vertex group is the
displayed fiber product times `S_t`. Map the fiber product to
`J_v intersect phi J_u phi^(-1)` by the common right-side restriction.
This map is surjective: each common image has a lift from each side.
Its kernel is `ker(rho_u) x ker(rho_v)`, so each image has exactly the
product of the kernel orders in its fiber. Multiplication by `t!` proves
the order formula without an assumption that restriction is faithful.

If a pair acts trivially on the glued vertex set, it acts trivially on every
vertex of both complete pointed neighborhoods, and hence both side
automorphisms are identities. The independent `D` action is also faithful.
This verifies the claimed faithful **vertex** action; the action on the
free-edge coordinates need not be faithful and does not have to be.
A fixed-skeleton completion isomorphism fixing the ordered roots must lie
in this group, so complete vector orbits classify rooted completions.
Additional signatures referencing side vertices may couple side and `D`
permutations; their stabilizer need not be obtained by replacing only the
independent `S_t` factor.

**Claim 03, supporting independent reasoning.** Given a target and an
admissible ordered edge, complete pointed-neighborhood representative lists
permit relabeling its two neighborhoods. Their actual overlap then supplies
an overlap map; moving it to a retained map requires transporting every
remaining edge at the same time. A full completion orbit minimum under the
residual group supplies the final representative. Every step preserves the
invariant target predicate. Conversely a rooted completion isomorphism
restricts to isomorphisms of its pointed neighborhoods, so different
pointed-neighborhood classes or double-coset classes cannot become rooted
isomorphic after completion. For one fixed skeleton, Claim 02 supplies the
remaining equivalence. Keeping every distinguished-vertex automorphism orbit
is necessary. An arbitrary root choice cannot replace several such orbits.
An unrooted graph can have several inequivalent admissible ordered edges;
the stated additional selector for unrooted uniqueness is therefore needed.

## Order-43 applications and limits

For equal degrees `d`, each side-exclusive cell has `d-1-lambda` vertices.
The glued union has `2+lambda+2(d-1-lambda)=2d-lambda` vertices, leaving
`43-2d+lambda` in `D`. Thus the three `D` formulas `7+lambda`, `3+lambda`,
and `1+lambda` are correct.

The overlap is triangle-free because its triangle together with the adjacent
roots would be `K5`; its independent-five prohibition is inherited from the
ambient graph. It is `(3,5)`-free, whereas a single neighborhood is
`(4,5)`-free. No independent-four prohibition is transferred to a
neighborhood. For an edge, a side-exclusive cell is `(4,4)`-free, hence has
at most 17 vertices on the retained premise `R(4,4)=18`. Therefore
`d-1-lambda<=17` gives the codegree floor `lambda>=d-18`, yielding the
displayed lower bounds 2 and 3. The degree-18 row assumes an actual
prescribed family of at least thirteen degree-18 vertices; that condition
does not follow for every candidate. The two normalized degree-count
predicates are exhaustive within their stated minimum-degree-20 branch,
and leave lower-minimum branches outside that coverage.

Permitted use after repair and renewed independent review: mathematical
symmetry reduction with complete pointed-input, map, and full completion
coverage. An omission permutation alone needs a certified path or orbit
partition leading to retained representatives. No generator, enumeration,
solver, canonicalizer, installation, download, branch closure, novelty
claim, classical Ramsey certificate audit, or order-43 decision occurred in
this review. The application theorems remain dependencies rather than new
unconditional order-43 pair-existence claims.
