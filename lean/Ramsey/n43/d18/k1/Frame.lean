module

public import Ramsey.defs.RootedRamseyGraph
public import Ramsey.n17.Regularity

/-!
# Double-core frames for the K1 reduction

An adjacent pair with no common neighbor determines 2 core cells and a common antineighborhood.
Admissibility records the core and side conditions without assuming the full Ramsey property.
-/

namespace Ramsey.d18.k1

/-- The adjacent roots of a double-core frame have no common neighbor. -/
public structure Frame (G : SimpleGraph (Fin 43)) where
  /-- The original degree-18 pivot. -/
  v : Fin 43
  /-- Its isolated neighbor. -/
  u : Fin 43
  /-- The roots are adjacent. -/
  adjacent : G.Adj v u
  /-- No vertex is adjacent to both roots. -/
  separated : ∀ x, ¬(G.Adj v x ∧ G.Adj u x)

namespace Frame

variable {G : SimpleGraph (Fin 43)}

/-- The 17-core adjacent to the original pivot. -/
@[expose] public def C (F : Frame G) : Set (Fin 43) :=
  rowSet G (antiNeighborSet G F.u) F.v

/-- The 17-core adjacent to the isolated neighbor. -/
@[expose] public def D (F : Frame G) : Set (Fin 43) :=
  rowSet G (antiNeighborSet G F.v) F.u

/-- The 7 vertices adjacent to neither root. -/
@[expose] public def T (F : Frame G) : Set (Fin 43) :=
  antiNeighborSet G F.v ∩ antiNeighborSet G F.u

/-- First-core membership is adjacency to the first root away from the second root. -/
@[simp] public lemma mem_C (F : Frame G) (x : Fin 43) :
    x ∈ F.C ↔ G.Adj F.v x ∧ x ≠ F.u := by
  have h := F.separated x
  simp only [C, rowSet, antiNeighborSet, Set.mem_inter_iff,
    SimpleGraph.mem_neighborSet, Set.mem_ofPred_eq]
  tauto

/-- Second-core membership is adjacency to the second root away from the first root. -/
@[simp] public lemma mem_D (F : Frame G) (x : Fin 43) :
    x ∈ F.D ↔ G.Adj F.u x ∧ x ≠ F.v := by
  have h := F.separated x
  simp only [D, rowSet, antiNeighborSet, Set.mem_inter_iff,
    SimpleGraph.mem_neighborSet, Set.mem_ofPred_eq]
  tauto

/-- The first root neighborhood is the second root and the first core. -/
public lemma neighbor_v (F : Frame G) : G.neighborSet F.v = insert F.u F.C := by
  ext x
  simp only [SimpleGraph.mem_neighborSet, Set.mem_insert_iff, mem_C]
  have h := F.adjacent
  grind

/-- The second root neighborhood is the first root and the second core. -/
public lemma neighbor_u (F : Frame G) : G.neighborSet F.u = insert F.v F.D := by
  ext x
  simp only [SimpleGraph.mem_neighborSet, Set.mem_insert_iff, mem_D]
  have h := F.adjacent.symm
  grind

/-- The second root antineighborhood is the first core and the 7-cell. -/
public lemma anti_u (F : Frame G) : antiNeighborSet G F.u = F.C ∪ F.T := by
  ext x
  have h := F.adjacent.symm
  have hs := F.separated x
  simp only [antiNeighborSet, Set.mem_ofPred_eq, Set.mem_union, mem_C, T,
    Set.mem_inter_iff]
  grind

/-- The first root antineighborhood is the second core and the 7-cell. -/
public lemma anti_v (F : Frame G) : antiNeighborSet G F.v = F.D ∪ F.T := by
  ext x
  have h := F.adjacent
  have hs := F.separated x
  simp only [antiNeighborSet, Set.mem_ofPred_eq, Set.mem_union, mem_D, T,
    Set.mem_inter_iff]
  grind

/-- The 2 core cells are disjoint. -/
public lemma disjoint_CD (F : Frame G) : Disjoint F.C F.D := by
  apply Set.disjoint_left.mpr
  intro x hx hy
  exact F.separated x ⟨(F.mem_C x).mp hx |>.1, (F.mem_D x).mp hy |>.1⟩

/-- The first core is disjoint from the common antineighborhood. -/
public lemma disjoint_CT (F : Frame G) : Disjoint F.C F.T := by
  apply Set.disjoint_left.mpr
  intro x hx hy
  exact hy.1.2 ((F.mem_C x).mp hx).1

/-- The second core is disjoint from the common antineighborhood. -/
public lemma disjoint_DT (F : Frame G) : Disjoint F.D F.T := by
  apply Set.disjoint_left.mpr
  intro x hx hy
  exact hy.2.2 ((F.mem_D x).mp hx).1

/-- Each vertex belongs to a root or one of the 3 cells. -/
public lemma cover (F : Frame G) (x : Fin 43) :
    x = F.v ∨ x = F.u ∨ x ∈ F.C ∨ x ∈ F.D ∨ x ∈ F.T := by
  simp only [mem_C, mem_D, T, antiNeighborSet, Set.mem_inter_iff, Set.mem_ofPred_eq]
  tauto

/-- Core orders, regularity and side Ramsey types required before cross-core completion. -/
public structure Admissible (F : Frame G) : Prop where
  /-- The first core has 17 vertices. -/
  card_C : Nat.card F.C = 17
  /-- The second core has 17 vertices. -/
  card_D : Nat.card F.D = 17
  /-- The common antineighborhood has 7 vertices. -/
  card_T : Nat.card F.T = 7
  /-- The first core excludes both homogeneous 4-sets. -/
  ramsey_C : IsRamseyGraph 4 4 (G.induce F.C)
  /-- The second core excludes both homogeneous 4-sets. -/
  ramsey_D : IsRamseyGraph 4 4 (G.induce F.D)
  /-- Every first-core vertex has 8 internal neighbors. -/
  regular_C : ∀ x : F.C, Nat.card ((G.induce F.C).neighborSet x) = 8
  /-- Every second-core vertex has 8 internal neighbors. -/
  regular_D : ∀ x : F.D, Nat.card ((G.induce F.D).neighborSet x) = 8
  /-- The first core together with the common antineighborhood is a valid 24-side. -/
  side_C : IsRamseyGraph 5 4 (G.induce (F.C ∪ F.T))
  /-- The second core together with the common antineighborhood is a valid 24-side. -/
  side_D : IsRamseyGraph 5 4 (G.induce (F.D ∪ F.T))

end Frame

end Ramsey.d18.k1
