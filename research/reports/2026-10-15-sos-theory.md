# Theory-only SDP/SOS investigation for order 43

Date: 2026-10-15. Coordinator: Codex. Task: `sos-theory-20261015`.
Input HEAD: `5c8d20526b37a1a74b6dbb3cb7540c6e829dec92`.
Authors: sos_pivot, sos_columns, sos_finite; coordinator authored obligation
certificates. Distinct reviewers audited exact source hashes.

Four proof notes and one bounded addendum contain seventeen independently
accepted local claims. [The manifest](../n43/d18/sos_theory_manifest.json)
pins reviewed bodies, original audits and integrated sources. Individual
author reports retain their historical ready/pending labels.

| Proof | Accepted result | Scope and limits |
| --- | --- | --- |
| [Pivot selection](../n43/d18/sos_pivot_selection.md) | Any twelve actual degree-18 roots contain an adjacent overlap<=10 pair; rational excess covariance sharpens root selection and family counts. | No universal twelve-root family is asserted. Conditional example h10,W50,Z290,e36,t=3/4 gives J>=801, selected q<=4,x<=169 and fourteen q<=7 roots; no realization is claimed. |
| [Finite moments](../n43/d18/sos_finite_moments.md), [order12 addendum](../n43/d18/sos_order12_addendum.md) | Census-free (4,4) core caps36/42/48 at orders11/12/13; size-six low-degree transversal requires q>=3. At q1,E_A<=29 an I4 has all A-degrees>=8. | The q1 anchor covers x138..167 and gives degree8/signature equality at E_A=0. It does not exclude size-four columns at q1. |
| [Column compatibility](../n43/d18/sos_column_compatibility.md) | Dispersed actual-column witnesses yield weighted monochromatic-triple lower bounds. Six columns need >=2 open triples; all 24 need `440+sum tau_y(tau_y+1)/2`, with `tau_y=max(0,6-c_y,c_y-13)`. | No universal violation is proved. The equality-anchor incidence Gram adds no information beyond opposite-pair counts; this limits that matrix, not the SOS hierarchy. |
| [Obligation graphs](../n43/d18/sos_obligation_graphs.md) | An explicit eight-leaf cycle-plus-opposite-matching graph has rational SOS independent-set bound40/11, hence integer cap 3 and cover>=5, rejecting star capacity4. | Fractional matching gives only 4. Every obligation edge needs an actual anchor/B-pair witness; no unavoidable occurrence or runtime advantage is claimed. |

The ambient types remain A=K4/I5-free (I4 allowed), B=K5/I4-free. Results
apply on their recorded hypotheses across varying x. A degree-18 pivot is
not assumed to exist in every candidate, and gluing still needs every allowed
overlap, map and completion. No eleven-root coverage, uniform positive anchor
packing or unavoidable obligation graph was proved.

Exact rational checks validated polynomial/matrix identities; integration
matched all five reviewed-body, audit and source hashes and resolved links.
No solver, graph enumeration, catalogue acquisition or theorem prover ran.
Acceptance is mathematical review, not a formal certificate or novelty claim.
No global Ramsey bound changed. Later branch states are in
[results](../../results.md), including the subsequently accepted x136 closure.
