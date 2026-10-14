# Above the equality frontier

Overview: `n43/d18/x-ge137`, for the range x>=137. State: open.
All case folders are siblings under [degree-18 pivot](../README.md).
This overview has no case subfolders and is not an additional disjoint child.

For the inherited order-43 graph and degree-18 pivot write A=N(v), B=M(v),
q=85-e(A), and E_A=sum_A(d_G(u)-18). The exact identity
x=136+2q+E_A gives the following disjoint cases. Each x137..142 branch
contains all its q profiles, each with a README.

| Sibling case | Predicate | All necessary (q,E_A) profiles | Status |
| --- | --- | --- | --- |
| [x137](../x137/README.md) | x=137 | (0,1) | Open; r=4 excluded |
| [x138](../x138/README.md) | x=138 | (0,2), (1,0) | Open |
| [x139](../x139/README.md) | x=139 | (0,3), (1,1) | Open |
| [x140](../x140/README.md) | x=140 | (0,4), (1,2), (2,0) | Open |
| [x141](../x141/README.md) | x=141 | (0,5), (1,3), (2,1) | Open |
| [x142](../x142/README.md) | x=142 | (0,6), (1,4), (2,2), (3,0) | Open; every column has size at least four |
| [x-ge143](../x-ge143/README.md) | x>=143 | Retain x=136+2q+E_A | Open residual branch |

No unconditional x<=142 bound is established here. The residual case is
required for coverage. Profiles are numerical predicates, not isomorphism
classes or assertions of realizability.

[Transfer summary](../transfer_summary.md) distinguishes inherited premises,
new deductions, their exact independent reviews, and permitted search use.
[Transfer bounds](../transfer_bounds.md) gives the complete count table, x142
adjacent-pivot bounds, and pair/triple compatibility tests.

[Frontier band](../frontier_band.md), [pivot classes](../pivot_classes.md),
and [excess bounds](../excess_bounds.md) contain conditional reductions.
They do not close the unrestricted branch. Exact scope and existing status
remain in [reduction index](../../reductions.md), section 8.
