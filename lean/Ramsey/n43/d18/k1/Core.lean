module

public import Ramsey.n17.R44
public import Ramsey.n43.d18.k1.Frame

/-!
# Classification of 17-vertex cores

The general 17-vertex (4,4)-Ramsey classification supplies the core structure results.
-/

namespace Ramsey.d18.k1.Frame

/-- Both admissible K1 cores are copies of the quadratic-residue graph on 17 vertices. -/
public theorem paley_cores {G : SimpleGraph (Fin 43)} (F : Frame G) (hF : F.Admissible) :
    Nonempty ((G.induce F.C) ≃g n17.paley17) ∧
      Nonempty ((G.induce F.D) ≃g n17.paley17) :=
  ⟨n17.isomorphic_paley17 hF.ramsey_C hF.card_C,
    n17.isomorphic_paley17 hF.ramsey_D hF.card_D⟩

end Ramsey.d18.k1.Frame
