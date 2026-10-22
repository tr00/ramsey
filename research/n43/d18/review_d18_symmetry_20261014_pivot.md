# Independent review of column-multiset symmetry coverage

Editorially condensed on 2026-10-21; [original audit and lineage](../../reports/2026-10-21-research-cleanup.md).

Date: 2026-10-14. Reviewer: `pivot_coverage` agent, distinct from the
earlier `symmetry-d18-20261014` author.

Claim(s): `symmetry_reduction.md#claim-d18-symmetry-01` through
`#claim-d18-symmetry-06`.

Reviewed revision: proof file SHA-256
`bbb24262ca5833d59c89c44eeb75664c6a07f092cd2ef7596d008e591e53b50a`.
All findings concern this exact text; metadata-only integration can preserve
this mathematical acceptance, but a changed proof requires renewed review.

Dependencies reviewed: finite group actions and lexicographic order were
checked directly. The small-column count/multiplicity premises were read in
`x136/small_columns.md`, SHA-256
`f542dc5f73640d4d9b9da8790638dfd2d546feed79c5d8633d2ed3155f680733`,
and the four-transversal and size-four edge bounds in `frontier_band.md`,
SHA-256 `0b8eaa6bd7ca0c6ea8691409112754ab2f0d4b2730166ff4d843b5b807269a54`.
The previously accepted r3 exclusion and existing r4 exclusion supply the
live table's coverage only. Recorded census extrema remain external
premises; their catalogues were not recertified in this review.

## Independent checks

Claims 01--06 were independently checked. Column multisets first quotient
by S24 and Aut(A), then B completions use the full multiset stabilizer,
with duplicate occurrences retained. Sorted-prefix comparisons preserve a
least full path; partial lex constraints require their assigned-domain and
full-vector hypotheses. Group generators alone need not give full minimality.

The multiplicity and forced-edge premises were rederived with exact x/q
scope, including non-forced size 10 repeats at x140/141. Duplicate-swap orbit
bounds and the complement degree selector were recomputed. The generator
claim remains draft; complete A generation, actual permutations, surviving
paths, root ties and completion certificates require separate validation.

Outcome: accepted for the mathematical claims and their exact scopes on
the retained external premises. Permitted use: symmetry coverage from
Claims01,02,05; multiplicity and forced-edge propagation from Claims03,04;
complement-orientation and degree-count propagation from Claim06.

Limits: these accepted mathematical arguments do not implement or certify a
generator, automorphism enumeration, canonicalizer, or orbit-coverage log.
The proposed generator remains a draft design. A future proof must supply
complete A coverage, directly checked permutation actions/rejection witnesses,
all retained Ramsey constraints, and a connection from symmetry-broken
subproblems to the original decision. Appended lex constraints need their
coverage argument; they are not ordinary logical consequences of the original
Ramsey CNF. No solver, graph enumeration, installation, download, external
catalogue audit, or novelty review was performed.
