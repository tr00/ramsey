# Independent audit of pending transversal claims

Editorially condensed on 2026-10-21; [original audit and lineage](../../research/reports/2026-10-21-research-cleanup.md).

Date: 2026-10-15. Task token: `audit-pending-20261015`.

Claim(s): all four `claim-transversal-deletion-01` through `-04` in
[transversal_deletion.md](transversal_deletion.md), and all four
`claim-transversal-compatibility-01` through `-04` in
[transversal_compatibility.md](transversal_compatibility.md).

Author and reviewer: the source author is the transversal compatibility
agent; reviewer is `/root/audit_transversals`, an independently assigned
audit agent. The reviewer derived the arguments before reading the concurrent
deletion review. That review is supporting provenance, not the basis for
these outcomes.

Reviewed revision: working tree based on commit
`b12925f7a96d24e18d06b0237930a32e30660ca2`; exact source SHA-256 values:

```text
03f47814e5092641864b3f221c06f09123e2364ab0068a05d2cdb8d0bb46dee1  docs/general_theorems/transversal_deletion.md
fb591c3905f288906230cfd7a5318e64feaf64490150c24a486ed20be2df63e1  docs/general_theorems/transversal_compatibility.md
```

These hashes were checked repeatedly during the audit and immediately before
creating this review. Review acceptance applies to these snapshots. A later
metadata-only acceptance update does not change the reasoning audited here;
any mathematical change requires renewed review.

Dependencies reviewed:

```text
4c084b03583248dc7c7ed56324ec5b6801bdca5278cf4fc17fa7e845dc07825e  research/n43/d18/transversal_four.md
0b8eaa6bd7ca0c6ea8691409112754ab2f0d4b2730166ff4d843b5b807269a54  research/n43/d18/frontier_band.md
e855ca074447be16c6d42a1924d067702972e1d7147b7522f121bf08c2fb9dff  research/n43/d18/x136/r2/low_excess_columns.md
fdae3de53cd7d68e9d7d414829d13be4cae4928e70b3f1aac3986e88b6a7727b  research/n43/d18/x136/r2/review_low_excess_columns_20261014_triples.md
0d95f98f6682272b1bf2ec561d6f87018f6c74b5bb2f0c57d0cbfcd48f6b6f61  research/n43/d18/x136/r2/review_low_excess_columns_20261014_pivot.md
```

The starting points and workflow were read. The retained external inputs are
Turan's balanced extremal theorem and equality case, the supplied Ramsey
upper bound interface, and for the numerical applications the recorded values
`R(4,3)=R(3,4)=9`, `R(3,5)=14`, maxima 85 for `(4,5,18)`, 79 for
`(4,5,17)`, 50 for `(4,4,14)`, and minima 50 for `(4,4,15)` and 41 for
`(4,4,14)`. Their applications and inequality directions were checked; no
external census or literature certificate was independently recertified.

## Decisive independent checks

Deletion partitions edges into the remainder, attachments and T. Turan on
the complement gives the balanced internal-edge minimum; Ramsey bounds give
the attachment floor. Strict threshold failure excludes a transversal;
zero defects give only conditional equality structure. All t0/t=n/empty and
zero-attachment boundaries were checked. The numerical thresholds are71
for t3 and 66 for t4; the latter does not imply existence.

Compatibility01 uses occupancy plus nontransversality to force every
specified t-subset to occur; independence needs t>=2. Ordered-weight signs
and the separate empty-set exclusion were checked in Claim 02. Claim 03's
low-degree cases cover every |L|, with strict capacity gaps and hereditary
I4-freeness only in deleted remainders. For the frontier specialization,
actual B columns supply degree-sum cap 32; all six abstract hypotheses were
checked at N10,P14,D90, including33>32,55>52,88<90,89<90.
The arbitrary-transversal floor9 and degree cap 40 were independently rederived.

## Per-claim outcomes

| Claim | Outcome | Exact dependency and scope limit |
| --- | --- | --- |
| Deletion 01 | accepted | Conditional on its proved `R,L` interface and Turan; no existence or attained-extremum assumption |
| Deletion 02 | accepted | Deletion 01 component bounds, integer `L`, and Turan equality |
| Deletion 03 | accepted | Deletion 01, `R(4,3)=9`, and the order-15 minimum 50 |
| Deletion 04 | accepted | Deletion 01–02, `R(4,3)=9`, and the order-14 minimum 41; supplies a necessary budget only |
| Compatibility 01 | accepted | Set inclusion, with `1<=t<=|L|`; independence conclusion requires `t>=2` |
| Compatibility 02 | accepted | Compatibility 01 and its stated ordered weight bounds, occupancy gap, and transversal exclusion |
| Compatibility 03 | accepted | Compatibility 01 and every one of its six explicit hypotheses; degrees are full degrees in the same graph |
| Compatibility 04 | accepted | Compatibility 03 and full frontier/interface setting, including the arbitrary-transversal degree bounds |

No proof in these eight claims requires withdrawal at the reviewed revisions.

## Permitted use and limits

The stated propagation uses are justified: transversal size lower bounds,
exact deletion defect budgets, weighted occupancy and avoidance, and
intersection of frontier four-transversals. Termination is justified only
for a case meeting the exact strict contradiction hypotheses. None of these
claims decides order 43 or proves a universal transversal-size-five theorem.

No source files, shared indexes, or Git state were edited by this reviewer.
No graph enumeration, solver, canonicalizer, installation, download, or
formal proof checker was used. No novelty assessment was performed.
The numerical literature inputs remain conditional premises, and these
accepted mathematical reductions are not computational nonexistence
certificates. No substantive gap or dependency misuse was found.
