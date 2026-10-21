# Independent review of weighted avoidance and transversal compatibility

Editorially condensed on 2026-10-21; [original audit and lineage](../../reports/2026-10-21-research-cleanup.md).

Date: 2026-10-15. Reviewer: `augmentation_author`.

Claim(s): [transversal compatibility](transversal_compatibility.md), claims
`claim-transversal-compatibility-01` through
`claim-transversal-compatibility-04`, including the stated limitations on
singleton-overlap applications.

Author and reviewer: transversal compatibility author and augmentation author,
distinct agents.

Reviewed revision: exact uncommitted theorem SHA-256
`fb591c3905f288906230cfd7a5318e64feaf64490150c24a486ed20be2df63e1`.

Dependencies reviewed: The family and degree-gap arguments are proved directly.
For the numerical recovery, the source
`n43/d18/x136/r2/low_excess_columns.md` was independently reread at SHA-256
`e855ca074447be16c6d42a1924d067702972e1d7147b7522f121bf08c2fb9dff`,
especially its setting and claims 01–02. The four-transversal source was
read at SHA-256
`4c084b03583248dc7c7ed56324ec5b6801bdca5278cf4fc17fa7e845dc07825e`;
its numerical census minimum was not recertified. Classical `R(3,4)=9`
and the source degree/transversal/census premises remain explicit assumptions.

## Independent checks

All four claims were independently checked. Occupancy plus avoidance of
L-T forces exact T occurrence; independence needs t>=2. Empty-family and
empty-transversal cases were handled explicitly. Ordered-weight signs are
correct even for negative real weights; vertexwise alternatives require
nonempty candidates.

The low-degree argument covers ell<s, ell=s, ell=s+1 and the remaining
ell=s+2 case using the two strict total gaps. Deleted remainders are I4-free;
the ambient graph need not be. The full frontier substitution N10/P14/D90
satisfies33>32,55>52,88<90,89<90. The theorem assumes disjoint transversals;
singleton overlaps still require their separate source case analyses.

Outcome: **accepted**, claims 01–04 at the exact reviewed theorem hash,
on their explicitly recorded premises.

Limits: This independent mathematical audit is not a formally checked
certificate. Published census extrema and classical Ramsey values were not
recertified. No novelty review was performed. The abstract theorem can
terminate a case requiring disjoint transversals only after all of its
strict numerical gaps and induced-subgraph hypotheses are independently
established for that case. It does not prove a universal five-transversal
bound, a universal degree-ten exclusion, or an order-43 nonexistence result.
