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
#print axioms Ramsey.degree18_cross_le_288
#print axioms Ramsey.degree18_cross_range
#print axioms Ramsey.isRamseyGraph_five_five_iff_pivot_interface
#print axioms Ramsey.TransversalFour.transversal_card_ge_four
#print axioms Ramsey.pivot_neighbor_degree_sum
#print axioms Ramsey.card_mixedCell_le_17
#print axioms Ramsey.d18.disconnected_neighborhood_classification
#print axioms Ramsey.d18.connectivity_classification
#print axioms Ramsey.d18.degree18_cross_le_279
#print axioms Ramsey.d18.isDisconnectedNeighborhood_iff
#print axioms Ramsey.d18.subcase_cover
#print axioms Ramsey.d18.excludes_of_subcases
#print axioms Ramsey.isRamseyGraph_induce_rowSet
#print axioms Ramsey.card_neighborSet_eq_eight_of_isRamseyGraph_4_4
#print axioms Ramsey.d18.k1.rigidity
#print axioms Ramsey.d18.c.w0.zero_excess_iff
#print axioms Ramsey.d18.c.w0.class_of_zero_excess
#print axioms Ramsey.d18.c.w0.complete_of_connected
#print axioms Ramsey.d18.subcaseClass_k1
#print axioms Ramsey.d18.k1.exists_admissible
#print axioms Ramsey.d18.k1.core_isSRGWith
#print axioms Ramsey.d18.k1.core_total_paircodegrees
#print axioms Ramsey.d18.k1.core_nonedge_common_anti_triangle
#print axioms Ramsey.d18.k1.core_nonedge_miss_unique
#print axioms Ramsey.d18.k1.attachment_cross_ge_sixty_four
#print axioms Ramsey.d18.k1.Frame.degree_C
#print axioms Ramsey.d18.k1.Frame.C_T_degree_bounds
#print axioms Ramsey.d18.k1.Frame.isolated_T_core_degree_ge_ten
#print axioms Ramsey.d18.k1.Frame.core_excess_budgets
#print axioms Ramsey.d18.k1.Frame.T_excess_range
#print axioms Ramsey.d18.k1.Frame.root_cross_excess
#print axioms Ramsey.d18.k1.Frame.total_excess
#print axioms Ramsey.d18.k1.Frame.parameters_allowed
#print axioms Ramsey.d18.k1.ramsey_iff_compatible
#print axioms Ramsey.d18.k1.replace_ramsey_iff_compatible
#print axioms Ramsey.d18.k1.Key.ofFrame_reconstruct
#print axioms Ramsey.d18.k1.Key.matrix_card
#print axioms Ramsey.d18.k1.Key.assemble_injective
#print axioms Ramsey.d18.k1.Key.valid_filters
#print axioms Ramsey.d18.k1.reduction
#print axioms Ramsey.d18.k1.complete_by_parameters
#print axioms Ramsey.d18.k1.complete_of_reduced
#print axioms Ramsey.d18.k1.excludes_of_reduced
