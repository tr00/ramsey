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

#print axioms Ramsey.isRamseyGraph_induce_neighborSet_succ
#print axioms Ramsey.RamseyUpperBound.card_neighborSet_lt
#print axioms Ramsey.ramsey_two_left
#print axioms Ramsey.RamseyUpperBound.add
#print axioms Ramsey.ramsey_3_2_le_3
#print axioms Ramsey.ramsey_4_2_le_4
#print axioms Ramsey.ramsey_3_3_le_6
#print axioms Ramsey.ramsey_4_3_le_9
#print axioms Ramsey.ramsey_4_4_le_18

#print axioms Ramsey.R_5_5_43
#print axioms Ramsey.ramseyNumber_5_5_le_43_of_d18_d20
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
#print axioms Ramsey.isRamseyGraph_induce_mixedCell
#print axioms Ramsey.card_neighborSet_eq_eight_of_isRamseyGraph_4_4
#print axioms Ramsey.d18.k1.rigidity
#print axioms Ramsey.d18.subcaseClass_k2
#print axioms Ramsey.d18.k2.exists_structure
#print axioms Ramsey.d18.k2.strict_reroot
#print axioms Ramsey.d18.k2.excludes
#print axioms Ramsey.d18.c.w0.zero_excess_iff
#print axioms Ramsey.d18.c.w0.class_of_zero_excess
#print axioms Ramsey.d18.c.w0.complete_of_connected
#print axioms Ramsey.d18.subcaseClass_k1
#print axioms Ramsey.d18.k1.exists_admissible
#print axioms Ramsey.n17.isSRGWith
#print axioms Ramsey.n17.total_paircodegrees
#print axioms Ramsey.n17.nonedge_common_anti_triangle
#print axioms Ramsey.n17.paley17_isRamseyGraph
#print axioms Ramsey.n17.isomorphic_paley17
#print axioms Ramsey.d18.k1.Frame.paley_cores
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
#print axioms Ramsey.Boundary.card_profile_le
#print axioms Ramsey.Boundary.capped_homogeneousNumber
#print axioms Ramsey.Boundary.isRamseyGraph_iff_candidates
#print axioms Ramsey.Boundary.entry_eq_zero_iff
#print axioms Ramsey.Boundary.homogeneousNumber_lt_one_iff
#print axioms Ramsey.Boundary.entry_glue
#print axioms Ramsey.Boundary.glue_congr
#print axioms Ramsey.Boundary.capped_cliqueNumber_join
#print axioms Ramsey.Boundary.capped_indepNumber_antijoin
#print axioms Ramsey.Boundary.glue_order_sub
#print axioms Ramsey.Boundary.uniform_replacement
#print axioms Ramsey.Boundary.uniform_ordered_replacement
#print axioms Ramsey.Boundary.uniform_replacement_observations
#print axioms Ramsey.Boundary.uniform_replacement_isRamseyGraph
#print axioms Ramsey.Boundary.profile_eq_of_same_retained_boundary
#print axioms Ramsey.Boundary.forget_entry
#print axioms Ramsey.Boundary.forget_congr
#print axioms Ramsey.Boundary.forget_entry_empty_one
#print axioms Ramsey.Boundary.introduce_entry
#print axioms Ramsey.Boundary.introduce_congr
#print axioms Ramsey.Boundary.relabel_entry_image
#print axioms Ramsey.Boundary.relabel_congr
#print axioms Ramsey.Boundary.forget_order
#print axioms Ramsey.Boundary.introduce_order
#print axioms Ramsey.Boundary.relabel_order
#print axioms Ramsey.isNIndepSet_insert
#print axioms Ramsey.isNIndepSet_induce_iff
#print axioms Ramsey.isNClique_union
#print axioms Ramsey.isNIndepSet_union
#print axioms Ramsey.clique_card_le_of_cliqueFree
#print axioms Ramsey.independent_finset_card_le_of_indepSetFree
#print axioms Ramsey.IsTransversal.mono
#print axioms Ramsey.not_isTransversal_iff
#print axioms Ramsey.isCliqueTransversal_iff_cliqueFree_deleted
#print axioms Ramsey.isIndepTransversal_iff_indepSetFree_deleted
#print axioms Ramsey.cliqueTransversal_compl_iff
#print axioms Ramsey.isRamseyGraph_induce
#print axioms Ramsey.isRamseyGraph_induce_subset
#print axioms Ramsey.isRamseyGraph_induce_antiNeighborSet_succ
#print axioms Ramsey.RamseyUpperBound.card_lt
#print axioms Ramsey.RamseyUpperBound.card_antiNeighborSet_lt
#print axioms Ramsey.induced_row_card
#print axioms Ramsey.row_union_card
#print axioms Ramsey.inducedEdgeCount_union
#print axioms Ramsey.inducedEdgeCount_univ
#print axioms Ramsey.edge_count_partition
#print axioms Ramsey.degree_sum_links
