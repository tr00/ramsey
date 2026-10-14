# Four Size-Four Columns Excluded

Date: 2026-10-14

In the degree-18 `x=136` branch, the case with four size-four cross columns is
impossible.

The four columns would form a `K4` in `B`, and the remaining twenty columns
would have size six. Using the audited internal-degree range for elements of a
size-four transversal:

- an `A`-vertex cannot lie in two of the four columns;
- hence the four size-four signatures are pairwise disjoint;
- every independent 4-set in `A` must meet each signature exactly once;
- its four vertices then have at most 32 total cross incidences;
- the independent-anchor signature bound requires at least 36.

Therefore:

```text
r <= 3
```

for the number `r` of size-four columns at `x=136`.

The remaining necessary small-column count branches are:

```text
r=0: s=8..10
r=1: s=6..10
r=2: s=4..7
r=3: s=2..3
```

where `s` is the number of size-five columns.

Full proof:

`/scratch/ramsey/docs/degree18_r4_exclusion.md`
