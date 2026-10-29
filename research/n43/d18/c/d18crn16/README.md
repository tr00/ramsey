# Families reducing connected degree-18 neighborhoods to order 16

Branch name: `d18crn16`. Parent: [connected d18c](../README.md).
Retained for proved family reductions with two consecutive safe contractions.
The target order is guaranteed attained; further reductions can be possible.
The ambient connected branch remains **open**.

The authoritative statements, hypotheses, proofs and independent reviews are
in [safe_contractions.md](../safe_contractions.md). Apply the inherited
residual filters `70<=a<=81`, `kappa(A)>=4`, and `tau_4(A)>=3` to the families.

| Family | Criterion | Guarantee |
| --- | --- | --- |
| [Compatible disjoint safe-edge pairs](../safe_contractions.md#double-contractions) | Both edges are individually safe; their endpoint pairs are anticomplete, or their common external neighborhood union is independent | Both contractions are safe in either order; order 16 |
| [Two adjacent twin modules](../safe_contractions.md#module-forcing) | Two distinct adjacent twin pairs | The contractions commute; order 16 and edge count `a-10` |

The first criterion is an exact compatibility theorem and has reviewed
residual witnesses. The second is a structural forcing family; its common
four-neighborhoods must meet in exactly one vertex, and the
[count bound](../safe_contractions.md#twin-count-sharpening) permits at most
two such pairs. Existence of a residual graph with two adjacent twin modules
has not been established.

These folders index proved families, not example histories or a complete
catalogue. Preserve original bags, endpoint/interface rows, inverse
attachments, and original root-selection constraints. Supporting concrete
certificates live in the [shared example manifest](../safe_contraction_examples.json).
