-- Axiom audit for the public targets of the Ramsey package against the
-- project evidence rules. Tooling file, not a library
-- module: lake does not build it, scripts/check.sh elaborates it directly.
--
-- Regenerate the expectation after an intentional premise or target change:
--   lake env lean scripts/Audit.lean > scripts/expected-axioms.txt
-- check.sh compares it modulo whitespace and axiom-list order.
--
-- Add a #print line whenever a new theorem becomes part of a handoff.
import Ramsey

#print axioms Ramsey.R_5_5_43
#print axioms Ramsey.ramseyNumber_5_5_le_43_of_d18_d20
#print axioms Ramsey.ramsey_5_5_eq_43
#print axioms Ramsey.exists_degree_18_or_20_up_to_compl
#print axioms Ramsey.degree_mem
#print axioms Ramsey.degree18_frontier_iff
#print axioms Ramsey.degree18_cross_ge_136
#print axioms Ramsey.isRamseyGraph_five_five_iff_pivot_interface
#print axioms Ramsey.TransversalFour.transversal_card_ge_four
#print axioms Ramsey.pivot_neighbor_degree_sum
#print axioms Ramsey.card_mixedCell_le_17
