# Independent review of column-multiset symmetry coverage

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

Checks and findings:

- Claim01's two-stage orbit quotient is valid. Arbitrary B permutations
  first identify column lists having the same multiset. The row action is
  simultaneous on all subsets. At a fixed multiset M, a pair (g,sigma)
  preserves its cross matrix precisely when C_(sigma(i))=g(C_i).
  Equality of multiplicities makes the projection to H_M surjective;
  its kernel is the product of within-signature occurrence permutations.
  Consequently |Gamma_M|=|H_M| product m_C!, and two completions of this
  fixed rooted A,M are isomorphic exactly when their B vectors share a
  Gamma_M orbit. The statement does not assert a unique unrooted root.
- Claim02 has a full surviving-path proof. For a least full sorted
  multiset M and its t-prefix P, the j-th order statistic of sort(gM)
  is at most that of sort(gP) for every j<=t. If sort(gP) first differs
  below P at entry k, the full transformed list is no larger before k
  and is strictly smaller by k, contradicting minimality. Thus every
  prefix of a least full representative survives. This uses prefixes
  in the one fixed subset order; arbitrary assigned multisets are not
  covered. Row degree/excess vectors and other row data must transform
  together, as the note requires.
- Claim03's arithmetic gives H upper bounds2+k,4+k,3+k,1+k,k for
  r=0..4 and hence H<=9 when k<=5. Three occurrences of size at least10
  consume at least12 units, impossible. Occurrences of size at most9
  form a B clique by the pair-union bound. Their A signature contains
  an edge: I5-freeness supplies it at size at least5, and the actual
  size-four edge bound3-q>=1 supplies it at size4. Three such
  occurrences with that A edge would give K5. Repeated pairs of size
  c>=7 consume2(c-6); the stated c<=6+floor((k+4)/2) bound and the
  distinction between k<=3 and k=4,5 follow. Triangle-freeness is
  imposed only on the common signature of a repeated adjacent pair.
- Claim04 follows without assuming duplicate vertices are twins in the
  completed B graph. At equality the kernel has p independent duplicate
  swaps with p<=12. The group-order bound4096|H_M| and fixed-A labeling
  count24!/2^p follow. Direct integer arithmetic confirms
  24!/4096=151476660579404160000. All three r rows correctly substitute
  H=s-8,s-6,s-4. These are upper bounds, not realizability or measured
  runtime claims. Newly tightened r2/s ranges can be integrated later
  without invalidating these historically valid necessary ranges.
- Claim05 correctly separates coverage from complete orbit minimization.
  A minimum full edge vector satisfies z<=lex gamma(z) for every element,
  so any selected comparisons retain a representative. Generators alone
  can retain several representatives, as the displayed C3 example shows.
  Partial-vector coverage requires the chosen group elements to preserve
  the common assigned domain and fixed conditions. Across several partial
  tests, preservation of prefixes of a single fixed full edge order gives
  the claimed least-full-vector path. The text explicitly excludes
  arbitrary changing domains and orders from that argument; no stronger
  unrestricted partial-pruning theorem is accepted here.
- Claim06 correctly uses the same root throughout. If n18<=n24=m,
  then m>=19-E and W>=(43-n18)+5m>=43+4m. Even W gives
  W>=44+4m>=120-4E. The local edge budget gives W<=24+2q+2E,
  forcing3E+q>=48, equivalent to3k-5q>=48 because k=2q+E.
  The strict contrary inequality therefore forces n18>n24. The count
  bound19-E may be negative at large E but remains a valid lower bound,
  so the quantified argument still holds. For k<=15,3k-5q<=45 gives
  the stated automatic orientation compatibility. The complement has
  reversed extreme-degree counts, and the fixed root itself becomes
  degree24, as the scope warning states.

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
