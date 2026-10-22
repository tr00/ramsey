# Independent review of the remaining s=6 normal form

Editorially condensed on 2026-10-21; [original audit and lineage](../../../../reports/2026-10-21-research-cleanup.md).

Date: 2026-10-14. Reviewer: `pivot_coverage` agent, distinct from the
`r2_low_s` author and the coordinator who supplied the two-degree-eleven
observation.

Claim: `low_excess_columns.md#claim-r2-low-excess-05`.

Reviewed revision: exact uncommitted proof SHA-256
`7268f1d5340b15e878e723518fc85b5c997c3210db039bf2f4b9fa67d32dbfc4`.
The earlier review of Claims01--04 at SHA-256
`116b354723ee5c7654beabf56709110333a0fd54332dbcdbf6228d3a2cf7fa77`
is preserved in
[the separate review](review_low_excess_columns_20261014_pivot.md).
The current Claims01--04 mathematical text is unchanged; Claim05 is an
appended deduction. This review independently audits its use of those
accepted local statements.

Dependencies reviewed: Claims01--04 at the current file hash; the earlier
overlap resource bound in `../pairwise_small_refinements.md`, SHA-256
`3900dbde7907b8c08feecb7d8dd7582be491c1bff50b1cfbe23476bd3d6b5c85`;
the equality row identity; pair-union reasoning; R(3,4)=9. Numerical
census premises remain those of the earlier review, without recertification.

## Independent checks

Claim 05 was independently checked. Two degree 11 transversal vertices would
make a diamond triangle with attachment sum>=23 against cap 22. At s6,
H2 plus the sole-large exclusion forces two size 7 columns. A degree 10 overlap
saturates the common B neighborhood with six L5 and two ordinary size 6
vertices; its three other small neighbors are independent. Any degree 11
overlap would share an ordinary vertex with it, giving K5.

All overlaps are therefore independent degree 10 vertices in both ordinary
columns, of size1/2; three independent overlap vertices would have insufficient
internal degree. At size 2 the transversal type is C4 or a diamond with the
overlap as tips. This is a necessary form, not an s6 contradiction.

Outcome: accepted on the recorded premises. Permitted search use:
propagate the prohibition on two degree11 vertices in any four-set
I4-transversal, and the exact r=2/s=6 overlap, common B neighborhood,
row-membership and internal T-type normal form in Claim05.

Limits: this is a necessary normal form; it supplies no s=6 contradiction
or exhaustive certificate. The singleton overlap of degree10 remains
covered, and no uniqueness of y_a across different overlap vertices is
assumed. External census premises were not recertified and novelty was
not checked. No solver, graph enumeration, download, or installation was
performed. A mathematical change requires renewed exact-revision review.
