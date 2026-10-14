# Lemma Phase II Report

Date: 2026-10-13

No computational exploration was performed. The proposed next lemmas were
attacked and independently audited.

## Main result

At the sharp degree-18 frontier, let

```text
F=complement G[N(v)].
```

Then `F` has 18 vertices, 68 edges, and independence number at most 3.
Using the published census fact that every 15-vertex `(4,4)`-Ramsey graph has
at least 50 edges, we proved:

```text
every K4 transversal of F has size at least 4.
```

Indeed, deleting a hypothetical three-vertex transversal leaves at least 50
edges, while the three deleted vertices have at least 21 edges back into the
remainder. This would force at least 71 edges in `F`, contradicting 68.

Therefore every cross column in the `x=136` branch has at least four vertices.
The previous 46/47-edge attachment cases are all impossible.

Detailed proof: `/scratch/ramsey/docs/transversal_four.md`.

## Other Phase II results

- `x=e(A,B)>=136`; equality forces `e(A)=85` and every `A`-vertex to have
  global degree 18.
- Simultaneous equality in the `I4` and `K4` anchor bounds forces the anchored
  `4 x 4` block to be `C8` or two disjoint `C4`s.
- Exact rooted degree-energy identities were proved.
- In the 18-regular corner, edge codegrees are at least 2 and nonedge
  codegrees at least 3.

## What was rejected

- Anchor equality is not itself contradictory.
- Local Ramsey constraints do not guarantee fractional perfect anchor designs.
- Regularity does not presently imply strong regularity.
- Cardinal and pair-intersection constraints alone do not eliminate the first
  nonedge-codegree case.

## Recommended continuation

Investigate whether the transversal number can be raised from 4 to 5. The
simple edge-count contradiction stops at 4, so the next step requires
structure of a four-vertex transversal and its 14-vertex remainder.

Full Phase II context is in
`/scratch/ramsey/docs/lemma_phase_2.md`.
