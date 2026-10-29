# Families reducing connected degree-18 neighborhoods to order 17

Branch name: `d18crn17`. Parent: [connected d18c](../README.md).
Retained for proved family reductions with one safe edge contraction.
The target order is guaranteed attained; further reductions can be possible.
The ambient connected branch remains **open**.

The authoritative statements, hypotheses, proofs and independent reviews are
in [safe_contractions.md](../safe_contractions.md). The forcing results target
residual `d18c`: `70<=a<=81`, `kappa(A)>=4`, and `tau_4(A)>=3`.

| Family | Criterion or exact generator | Guarantee |
| --- | --- | --- |
| [Adjacent twin module](../safe_contractions.md#module-forcing) | A proper module containing an edge; equivalently here an adjacent twin pair | Contract the pair; order 17 and edge count `a-5` |
| [Independent degree-four anchor](../safe_contractions.md#degree-four-defect) | Its four-vertex defect graph has an isolated vertex; at most one defect edge is sufficient | Contract an isolated-defect spoke; order 17 and edge count `a-1` |
| [Marked-parent inverse splitting](../safe_contractions.md#noncritical-parents) | Generate from a marked 17-vertex parent using the exact attachment conditions in section 3 | Every passing lift has a certified contraction back to that parent |

The adjacent-twin theorem includes an exact four-row generator. These are
families specified by structural conditions, rather than a list of graphs
that happened to contract. The unprovided parent catalogue is not asserted
complete, and no order-43 extension is asserted.

Keep original vertex bags, separate endpoint/interface rows, inverse
attachments, and original root-selection constraints when applying a family
reduction. All supporting concrete certificates are consolidated in the
[shared example manifest](../safe_contraction_examples.json).
