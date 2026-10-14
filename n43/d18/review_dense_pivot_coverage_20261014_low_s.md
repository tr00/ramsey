# Independent review of dense degree-18 pivot coverage

Claim(s): [dense pivot coverage](dense_pivot_coverage.md),
`claim-dense-pivot-01`, `claim-dense-pivot-02`, `claim-dense-pivot-03`.

Author and reviewer: pivot-coverage agent; low-excess agent (distinct
identities). Date: 2026-10-14.

Reviewed revision: exact uncommitted file SHA-256
`ffb876fc478698c1a32a86298c29863bdfd562ca646706f8d93e630dc0a215d1`.

Dependencies reviewed: `pivot_classes.md` SHA-256
`43d4ff670667705f4f974ef69dfe37a1dc43aa09e7825a2fc7448cff60d76233`;
`excess_bounds.md` SHA-256
`2577e6eccf38b51fbb2d691d488d747302b4445fca31dbe344b64dd30af73c97`;
`frontier_band.md` SHA-256
`0b8eaa6bd7ca0c6ea8691409112754ab2f0d4b2730166ff4d843b5b807269a54`.
The retained identities x=136+2q+E and q+E<=W/2+4 were rederived from
degree/edge sums and the stated neighborhood/antineighborhood extrema.
The numerical census premises and established small Ramsey numbers were
checked for applicability, not independently recertified.

Checks and findings:

1. Claim01 uses only degree18 at the chosen family vertices and K5/I5
   avoidance. For a triangle, two codegree sets in the same18-vertex
   neighborhood have sum at most18+t, and the triple common neighborhood
   is independent of size at most4. Hence the assumed codegrees>=11
   force t=4 and all three edge codegrees11. Repeating at all three
   endpoints excludes exactly-one triangle attachments in the full G.
   For K4, outside signatures1 and2 are forbidden by a suitable triangle,
   signature4 by K5, leaving0 or3. The cut degree sum60 and outside
   pair-incidence sum54 cannot agree, since j=C(j,2) for j=0,3.
2. The neighborhood I4 prohibition inside the family was rechecked by
   the24 antineighborhood signatures. At most12 singleton columns and
   the exact degree18 row identities give sum_I lambda<=32, contradicting
   four assumed codegrees>=11. I4 is permitted in the ambient N(v);
   the contradiction proves the narrower family-neighborhood prohibition
   under the high-codegree assumption.
3. The direct connected paw-free argument is complete: an outside vertex
   attached to a maximal complete multipartite subgraph with>=3 parts
   meets at least two parts; differing adjacency within one part gives
   a paw using a neighbor in another part; missing two full parts gives
   a paw with a representative of a met part. Thus it extends the
   multipartite subgraph, contrary to maximality. Connectivity supplies
   an attached outside vertex whenever the subgraph is proper. With noK4
   there are exactly3 parts. In triangle-free components, the a=1,2,3
   cases follow the stated Ramsey bounds. For a=4, a13-vertex component
   has minimum degree>=4 by R(3,4)=9 on each nonneighborhood, contradicting
   the proved family-neighborhood I4 prohibition. Consequently each
   component has size<=3alpha, and additive independence numbers give
   family size<=12, contradicting13. Coverage is for the same family F
   and the same eventual edge, with no hidden pivot-selection assumption.
4. Claim02 was rederived independently: a root with m high-degree
   neighbors has E>=6m-D, while q+E<=3h+4-D/2. For h odd,D<=6 this
   gives m<=(h+1)/2. The high-degree cut is at least
   24h-D-2floor(3h²/8); with M roots at the upper neighbor count its
   capacity is at most(43-h)(h-1)/2+M. This yields M>=R_h-D. The
   nonnegative maximum in M_D is sound, and counts larger than p would
   themselves contradict the cut. The E,q, and x inequalities follow
   with the claimed quantifiers. D=0 gives exact E=3h+3 because all
   positive excesses are6.
5. Every displayed R_h and M_D was checked by an independent Python
   calculation of the stated arithmetic formula for odd h=1..35 and
   D=0,2,4,6. The h1,D6 exception W=0<h is properly marked inapplicable.
   The floor equality for m and x intervals were also checked over
   every permitted integer q,E satisfying their displayed inequalities.
   This calculation checks arithmetic, not realizability or graph
   nonexistence.
6. Claim03 applies Claim01 to the one family supplied by Claim02,
   retaining both endpoint bounds simultaneously. All displayed x values
   and neighborhood-edge intervals agree with Claim02. The four-column
   lower bound applies at D<=2 because both actual q<=2, independently
   of E and x. It is correctly withheld at D4/D6 unless actual q<=2.

Outcome: accepted, on the explicitly retained numerical literature premises.
No mathematical corrections are required for the reviewed revision.

Permitted search use: Claim01 and Claim03 supply existence coverage for a
complete two-root family; Claim02 supplies numerical propagation and
conditional family counts. No listed profile is closed. Applying the family
properties to an arbitrary earlier root, identifying separate guaranteed
pairs, or omitting allowed overlap maps/completions would exceed these claims.

Limits: census premises and small Ramsey-number certificates were not
recertified; no exhaustive graph computation, formal proof checking,
construction, or order-43 exclusion was performed. Novelty was not checked.
Proof changes require renewed exact-revision review.
