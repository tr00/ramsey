# Mathematical Phase I Report

Date: 2026-10-13

No computation or search was performed. The global bound remains

```text
43 <= R(5,5) <= 46.
```

## Best rigorous reductions obtained

1. **Canonical complement split.** Choose the lexicographically smaller sorted
   degree sequence between `G` and its complement. A minimum-degree pivot then
   has degree 18, 19, or 20. The respective paired degree counts satisfy
   `n18>n24`, `n19>n23`, or `n20>n22`.

2. **Two-size parity split.** If a minimum pivot is not required, the handshake
   lemma and complementation reduce an arbitrary pivot to degree 18 or 20.

3. **Exact interface criterion.** After fixing `A=N(v)` and `B=M(v)`, validity
   of the cross matrix is exactly the absence of all-one clique rectangles and
   all-zero independent-set rectangles whose side sizes sum to 5.

4. **Four-bit anchor signatures.** Relative to any `I4` in `A`, all column
   signatures are nonempty and satisfy Hall's condition on every independent
   set of `B`. Relative to any `K4` in `B`, all row missing-signatures are
   nonempty and satisfy the dual Hall condition on every clique of `A`.

   Consequences:

   ```text
   e(I4,B) >= 2|B|-12,
   e(A,K4) <= 2|A|+12.
   ```

   Equality has a rigid pattern of four triangles or four independent triples.

5. **Quadratic cross-edge pruning.** Four catalogue-free inequalities now bind
   cross-edge and cross-nonedge counts to the two internal edge counts. They
   follow from pair intersections, Turan, and Cauchy-Schwarz and are recorded
   in `docs/theory_phase_1.md`.

6. **Degree-18 corridor.** If the published `(4,5)` edge extrema are admitted,
   then for `a=e(A)`, `b=e(B)`, and `x=e(A,B)`:

   ```text
   50 <= a <= 85,
   144 <= b <= 160,
   max(306-2a,432-2b) <= x
     <= min(306,414-2a,576-2b).
   ```

   In particular, `x>=136`. A separate catalogue-free perfect-matching
   argument gives the weaker but independent bound `x>=120`.

7. **Normalized degree-20 parametrization.** Every degree sequence is
   represented by integers `j,t>=0`, `j+t<=21`:

   ```text
   n20=t+2j+1,
   n21=42-2(j+t),
   n22=t,
   e(G)=451-j.
   ```

   For a degree-20 pivot and neighbor-excess sum `s`:

   ```text
   b=a+51-j-s,
   x=380+s-2a,
   max(68,66+j+s) <= a <= min(100,92+j+s),
   j+s <= 34.
   ```

8. **Strongly regular branch excluded.** The parameter equation, local
   codegree bounds, eigenvalue discriminants, and trace condition exclude every
   strongly regular graph on 43 vertices satisfying the Ramsey constraints.
   A regular candidate would need at least four adjacency eigenvalues.

## Assessment

The strongest immediately useful development is the interface-signature
language. It replaces a raw product of neighborhood catalogues with:

- exact subset signatures;
- pair and triple intersection constraints;
- forced adjacencies between signature classes;
- a residual `Aut(A) x Aut(B)` action;
- anchored Hall and incidence inequalities.

This is suitable both for further hand proofs and, later, for a canonical
interface generator.

The current inequalities do not exclude either pivot branch. In particular,
both the 20-regular degree sequence and the sequence with one degree-20 vertex
and 42 degree-21 vertices survive.

## Recommended next mathematical targets

1. Use the degree-18 `a,b,x` corridor to prove incompatible requirements on the
   24 column signatures.
2. Prove a regular-to-strongly-regular rigidity lemma; the algebraic exclusion
   would then eliminate all regular candidates.
3. Strengthen the anchored Hall bounds through fractional matchings/covers of
   the `I4(A)` and `K4(B)` hypergraphs.
4. Establish a sharp rooted inequality for

   ```text
   h_v=e(G[N(v)])+e(bar(G[M(v)])),
   ```

   whose global sum is fixed by the degree variance.
5. Classify equality and near-equality cases of the four-bit anchor bounds
   before any full graph enumeration.

Detailed proofs, caveats, and source links are in
`/scratch/ramsey/docs/theory_phase_1.md`.
