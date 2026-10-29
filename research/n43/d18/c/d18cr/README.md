# Reducible connected degree-18 neighborhoods

Branch name: `d18cr`. Parent: [connected d18c](../README.md).
Object: an original rooted order-43 candidate `(G,p)` together with a chosen
locally safe edge `uv` inside its connected 18-vertex neighborhood `A` and
complete contraction/lift data. The branch is **open**.

The exact membership predicate is that some edge of `A` has a triangle-free
external neighborhood union. This is complementary to
[the irreducible branch](../i/README.md). Individual examples remain
[supporting evidence](../safe_contraction_examples.json), rather than new
branch folders or verified ambient instances.

Contract the chosen edge once. The root has degree 17 in the 42-vertex
quotient `H`, and its induced neighborhood is a `(4,5)`-free graph of order
17. Keep the merged vertex, original bags, both endpoint rows, inverse
attachments, and the original degree-18 root-selection constraints.

The [ambient quotient theorem](../safe_contractions.md#ambient-quotients)
specifies the extra condition for `H` itself to be `(5,5)`-free: the GLOBAL
external neighborhood union of `uv` must be `K4`-free. Local reducibility
alone does not imply that condition. Both alternatives remain covered:

| Original-instance alternative | Permitted quotient assumption |
| --- | --- |
| An edge inside `A` passes the global test | Choose it; `H` is an order-42 `(5,5)`-free graph with a degree-17 root |
| `A` is locally reducible but no edge inside it passes the global test | Use the marked 42-vertex quotient with full lift constraints; it may contain `K5` through the merged vertex |

These proved local families are indexed within this branch:

| Family | Guaranteed local reduction |
| --- | --- |
| [Adjacent twin modules](../safe_contractions.md#module-forcing) | One pair gives order 17; two pairs give order 16 |
| [Independent degree-four defect anchors](../safe_contractions.md#degree-four-defect) | An isolated defect vertex gives a safe spoke and order 17 |
| [Exact marked-parent generation](../safe_contractions.md#safe-edge-normal-form) and [trace coloring](../safe_contractions.md#safe-split-traces) | Generate all residual marked safe-edge lifts from order-17 parents |
| [Compatible disjoint safe edges](../safe_contractions.md#double-contractions) | Two contractions succeed in either order, giving local order 16 |

The forcing families use residual `70<=a<=81`, `kappa(A)>=4`, and
`tau_4(A)>=3` where stated. Their predicates overlap; they are not a complete
enumerated parent catalogue. Further local contractions remain histories
within this branch. The ambient `(5,5)` condition must be rechecked for any
contraction intended to reduce the full graph order.

The independently reviewed [ported d18 toolbox](toolbox.md) supplies exact
degree/excess and cross-count translations, parent connectivity and transversal
filters, anchor/row cuts, corrected quadratic bounds, column averaging/SOS
witnesses, fixed-B completion and marked symmetry. In the residual scope,
parents with at least73 edges already certify the original transversal bound;
at least76 edges makes four-connectivity of a valid split equivalent to both
endpoint attachments having size at least three. The
[global-safe profile table](toolbox.md#ambient-safe-filters) further restricts
ambiently safe lifts without excluding locally-only reductions.

The [split-aware adapter](split_interface.py) builds exact original completion
states from supplied marked parents and two endpoint attachments, retaining
16 singleton rows and both endpoint rows. Its
[validation driver](validate_split_interface.py) passes direct tiny graph and
recurrence comparisons, with distinct review recorded in the topic. Callers
must enforce the residual and original selected-root predicates. Complete
parent generation and an order-43 execution remain unimplemented.

The [Exoo inverse-edge investigation](../safe_contractions.md#exoo-inverse-splits)
is recorded in the shared topic, with reproducible source and obstruction
certificates. Independent review accepted the exclusion of every inverse
edge split of Exoo's source and the supplied known inputs. This is an
exclusion of those source families, without closure of this branch. General
42-vertex `(5,5)`-free graphs are known to exist; the scientific target is a
valid 43-vertex lift satisfying the original predicates. A verified such
lift would prove `R(5,5)>43`.
