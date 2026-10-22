# Continuing the 69-edge slice: small-column removal and critical identifications

Date: 2026-10-21. Task: `a69-attachments-20261021`.
Author: Main, working alone. User requested continued structural research.
Base HEAD: `3eebcca5e627fdc3df5f26fd2a1925a7c121153f`; concurrent changes
and other active WORK rows preserved. No staging or commits.

Review update (2026-10-21): all six claims received
[independent acceptance](../n43/d18/review_a69_attachment_obstructions_20261021_independent.md)
at the original proof hash recorded below. The reviewer found no substantive
gap and requested one non-blocking citation correction: list `R(3,5)=14`
in Claim 1's dependency metadata and the opening ledger. This citation and
an acceptance banner have been added without changing statements or proofs.
The remaining draft descriptions below record the author-stage handoff.

## Deliverable

[Ambient obstructions and critical contractions](../n43/d18/a69_attachment_obstructions.md)
contains six claims, all ready for independent review, with no accepted-status
or executable-pruning change. It continues the prior decomposition without
editing its recorded source or hash.

The principal new theorem is that nonadjacent degree-18 roots of overlap
two have neighborhood edge sum at least139, or at least140 plus common-neighbor
excess when those common neighbors are adjacent. The equal order-16 cores
make this a stronger inequality than the earlier generic bound138. It
forces a strict density move from a 69-edge root with any degree-18
two-column. Singleton columns similarly move the root to at least77.

A maximum-density degree-18 root at69 therefore has no singleton column
and at most one two-column. The exception has degree19 and B-degree17.
It cannot contain a leaf; its endpoints have internal degree at least2
and excess sum at most5. It exposes actual16/17 cores and a six-vertex
common-nonneighbor cell. Every accompanying three-column has degree18,
and the two B-neighborhoods intersect in a critical eight-cell and cover B.
No degree19 vertex is misused as an eligible degree18 destination.

Pure two-transversal graphs also have a new structural dichotomy: identification
of the transversal pair recovers a critical17 core or exposes an actual
mixed triangle/independent-triple defect. In the nonedge case only a mixed
triangle can prevent critical identification, and critical identification
requires exactly one common attachment. A critical identification forces
the attachment union to be the eight degree-seven vertices of the16 core;
those induce cubic S12, and their complement induces its complement.
The triangle/independent-triple defects themselves are not ambient contradictions.

Every16 core has triangle and independent-triple counts in54..58 and total
codegree-cap slack24. These restrict simultaneous attachments without
introducing an isomorphism-uniqueness premise.

## Validation and revision

The [retained self-check](2026-10-21-a69-attachment-checks.py) runs with

```sh
python3 research/reports/2026-10-21-a69-attachment-checks.py
```

It passed 1,371 overlap-two scalar cases, 448 exceptional-column scalar
budgets, triangle and codegree slack calculations, and direct checks of
the eight-plus-eight partition in a single explicitly defined Paley17 graph.
The latter checks its 2,380 four-subsets; it is fixed-graph validation,
not enumeration or catalogue acquisition. This auxiliary graph is not
claimed as an order43 witness or as the unique critical core.

The author audited the unequal-root degree identity, endpoint intersection
count, and all identified-vertex forbidden-set distributions. All proof
links, anchors, code fences, and six review states were checked.
Author self-checks are not independent review or branch-closure certificates.

| Artifact | SHA-256 |
| --- | --- |
| `research/n43/d18/a69_attachment_obstructions.md` | `e950033e2937805086c18e59f66d2863ad0aa8132fbd1e77436e695b31541e86` |
| `research/reports/2026-10-21-a69-attachment-checks.py` | `3d8fb75123ccf7c4dfcf5f2cf8daa5b0b54a8d9d2099b91ef876c42edd5d23ab` |

Post-review integration hashes:

| Artifact | SHA-256 |
| --- | --- |
| Proof with acceptance banner and citation correction | `0b76a39ba72727f787c393e9f6f596685fb1f6fac67f3fbc2338e5c97f9fd6b7` |
| Independent review | `2c8165b998bfbc9b78eac67cb4fa42d7a3ebda6707f7122dc0b35d4805e9a4cd` |

No solver, graph search, catalogue processing, downloads, installation,
subagents, Lean or engine change was used. Published core edge counts
and smaller Ramsey facts remain explicitly retained premises. The other
checkout's x137/x138 closures and concurrent maximal-pivot-density task
are not dependencies. Shared accepted-result indexes remain unchanged.

## Remaining scope

The results remove concrete small-column configurations from selected-root
coverage, but do not exclude arbitrary69-edge neighborhoods, the sole
degree19 two-column exception, or the collections with all columns of size
at least3. Higher-transversal attachment systems remain open. Next work
can combine the actual critical eight-cells, paired cores, and mixed-triangle
defects; no unavoidable contradiction among them is currently proved.
Independent review should precede mathematical integration or generator use.
The task's WORK ownership row is removed at this handoff.
