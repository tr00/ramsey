module

public import Ramsey.defs.BoundaryProfiles
public import Mathlib.Data.Finset.Sum

/-!
# Finite profiles and exact Ramsey observations

Actual finite-set witnesses establish all maximum and cap identities. Decomposition into
boundary and interior proves that the finite profile detects both forbidden colours exactly.
-/

namespace Ramsey.Boundary


open scoped Classical
variable {V W B X Y : Type*} {p q t n : ℕ}

/-- The selected colour relation is symmetric. -/
public lemma colourAdj_symm (G : SimpleGraph V) (k : Bool) {v w : V}
    (h : colourAdj G k v w) : colourAdj G k w v := by
  cases k <;> simp_all [colourAdj, ne_comm, G.adj_comm]

/-- Injective induced maps preserve the selected colour relation exactly. -/
public lemma colourAdj_comap (G : SimpleGraph V) (k : Bool) (f : W → V)
    (hf : Function.Injective f) (v w : W) :
    colourAdj (G.comap f) k v w ↔ colourAdj G k (f v) (f w) := by
  cases k <;> simp [colourAdj, SimpleGraph.comap_adj, hf.ne_iff]

/-- The empty set is homogeneous in each colour. -/
@[simp] public lemma homogeneous_empty (G : SimpleGraph V) (k : Bool) :
    Homogeneous G k ∅ := by simp [Homogeneous]

/-- A singleton is homogeneous in each colour. -/
@[simp] public lemma homogeneous_singleton (G : SimpleGraph V) (k : Bool) (v : V) :
    Homogeneous G k {v} := by simp [Homogeneous]

/-- Homogeneity is inherited by subsets. -/
public lemma Homogeneous.mono {G : SimpleGraph V} {k : Bool} {S T : Finset V}
    (h : Homogeneous G k S) (hTS : T ⊆ S) : Homogeneous G k T :=
  fun a ha b hb hab ↦ h a (hTS ha) b (hTS hb) hab

/-- The empty interior set is eligible for every boundary argument. -/
@[simp] public lemma eligible_empty (G : SimpleGraph (B ⊕ X)) (k : Bool) (U : Finset B) :
    Eligible G k U ∅ := by simp [Eligible]

/-- Every member of a finite family is bounded by its maximum cardinality. -/
public lemma le_maxCard [Fintype V] {P : Finset V → Prop} {S : Finset V} (hS : P S) :
    S.card ≤ maxCard P := by
  classical
  exact Finset.le_sup (f := Finset.card) (by simp [hS])

/-- Every uniform cardinality bound bounds the finite-family maximum. -/
public lemma maxCard_le [Fintype V] {P : Finset V → Prop}
    (h : ∀ S, P S → S.card ≤ n) : maxCard P ≤ n := by
  classical
  exact Finset.sup_le (fun S hS ↦ h S (Finset.mem_filter.mp hS).2)

/-- A nonempty finite family has a set attaining its maximum cardinality. -/
public lemma exists_maxCard [Fintype V] {P : Finset V → Prop} (hP : ∃ S, P S) :
    ∃ S, P S ∧ S.card = maxCard P := by
  classical
  obtain ⟨S, hS⟩ := hP
  obtain ⟨T, hT, he⟩ := Finset.exists_mem_eq_sup (Finset.univ.filter P)
    ⟨S, by simp [hS]⟩ Finset.card
  exact ⟨T, (Finset.mem_filter.mp hT).2, he.symm⟩

/-- An eligible witness gives a lower bound for its actual maximum. -/
public lemma le_rawEntry [Fintype X] {G : SimpleGraph (B ⊕ X)} {k : Bool}
    {U : Finset B} {S : Finset X} (hS : Eligible G k U S) :
    S.card ≤ rawEntry G k U := le_maxCard hS

/-- Every eligible family has a maximum witness, including empty eligible interiors. -/
public lemma exists_rawEntry [Fintype X] (G : SimpleGraph (B ⊕ X)) (k : Bool)
    (U : Finset B) : ∃ S, Eligible G k U S ∧ S.card = rawEntry G k U :=
  exists_maxCard ⟨∅, eligible_empty G k U⟩

/-- Uniform eligible-set bounds bound the actual entry. -/
public lemma rawEntry_le [Fintype X] {G : SimpleGraph (B ⊕ X)} {k : Bool}
    {U : Finset B} (h : ∀ S, Eligible G k U S → S.card ≤ n) :
    rawEntry G k U ≤ n := maxCard_le h

/-- Equality with an actual entry is equivalent to an upper bound and an attaining witness. -/
public lemma rawEntry_eq_iff [Fintype X] (G : SimpleGraph (B ⊕ X)) (k : Bool)
    (U : Finset B) : rawEntry G k U = n ↔
      (∀ S, Eligible G k U S → S.card ≤ n) ∧ ∃ S, Eligible G k U S ∧ S.card = n := by
  constructor
  · intro h
    exact ⟨fun S hS ↦ h ▸ le_rawEntry hS, h ▸ exists_rawEntry G k U⟩
  · rintro ⟨hu, S, hS, he⟩
    exact le_antisymm (rawEntry_le hu) (he ▸ le_rawEntry hS)

/-- Every capped entry is at most its threshold. -/
public lemma entry_le [Fintype X] (G : SimpleGraph (B ⊕ X)) (k : Bool) (t : ℕ)
    (U : Finset B) : entry G k t U ≤ t := min_le_left _ _

/-- Capping an already capped summand does not change a capped sum. -/
public lemma cap_add (t a b : ℕ) : min t (a + min t b) = min t (a + b) := by omega

/-- Capping both summands does not change a capped sum. -/
public lemma cap_add_cap (t a b : ℕ) : min t (min t a + min t b) = min t (a + b) := by
  omega

/-- Capping commutes with a maximum of natural numbers. -/
public lemma cap_max (t a b : ℕ) : min t (max a b) = max (min t a) (min t b) := by omega

/-- The profile map retains the boundary graph literally. -/
@[simp] public lemma profile_boundary [Fintype X] (G : SimpleGraph (B ⊕ X)) (p q : ℕ) :
    (profile G p q).boundary = boundaryGraph G := rfl

/-- Equality of state components gives equality without choosing proof transports. -/
private lemma profile_struct_ext {S T : Profile B p q} (hb : S.boundary = T.boundary)
    (hc : ∀ U hS hT, (S.clique ⟨U, hS⟩).val = (T.clique ⟨U, hT⟩).val)
    (hi : ∀ U hS hT, (S.indep ⟨U, hS⟩).val = (T.indep ⟨U, hT⟩).val) : S = T := by
  cases S with
  | mk H c a =>
    cases T with
    | mk H' c' a' =>
      dsimp at hb hc hi
      subst H'
      congr 1
      · funext U
        exact Fin.ext (hc U.val U.property U.property)
      · funext U
        exact Fin.ext (hi U.val U.property U.property)

/-- Concrete profiles are equal exactly when their boundary graphs and valid entries agree. -/
public theorem profile_eq_iff [Fintype X] [Fintype Y]
    (G : SimpleGraph (B ⊕ X)) (F : SimpleGraph (B ⊕ Y)) :
    profile G p q = profile F p q ↔
      boundaryGraph G = boundaryGraph F ∧
      (∀ U, Homogeneous (boundaryGraph G) true U → entry G true p U = entry F true p U) ∧
      (∀ U, Homogeneous (boundaryGraph G) false U → entry G false q U = entry F false q U) := by
  constructor
  · intro h
    refine ⟨congrArg Profile.boundary h, ?_, ?_⟩
    · intro U hU
      have hv : ∀ S : Profile B p q,
          ∀ hS : S = profile G p q, (S.clique ⟨U, by simpa [hS] using hU⟩).val =
            entry G true p U := by
        intro S hS
        subst S
        rfl
      exact (hv _ h.symm).symm
    · intro U hU
      have hv : ∀ S : Profile B p q,
          ∀ hS : S = profile G p q, (S.indep ⟨U, by simpa [hS] using hU⟩).val =
            entry G false q U := by
        intro S hS
        subst S
        rfl
      exact (hv _ h.symm).symm
  · rintro ⟨hb, hc, hi⟩
    exact profile_struct_ext hb (fun U hU _ ↦ hc U hU) (fun U hU _ ↦ hi U hU)

/-- Boundary equality and entry equality on valid arguments suffice for profile equality. -/
public theorem profile_ext [Fintype X] [Fintype Y]
    {G : SimpleGraph (B ⊕ X)} {F : SimpleGraph (B ⊕ Y)}
    (hb : boundaryGraph G = boundaryGraph F)
    (hc : ∀ U, Homogeneous (boundaryGraph G) true U → entry G true p U = entry F true p U)
    (hi : ∀ U, Homogeneous (boundaryGraph G) false U → entry G false q U = entry F false q U) :
    profile G p q = profile F p q := (profile_eq_iff G F).2 ⟨hb, hc, hi⟩

/-- Finite boundary types have only finitely many states at fixed thresholds. -/
public instance finiteProfile [Fintype B] : Finite (Profile B p q) := by
  classical
  let f : Profile B p q → Σ H : SimpleGraph B,
      ({U : Finset B // Homogeneous H true U} → Fin (p + 1)) ×
      ({U : Finset B // Homogeneous H false U} → Fin (q + 1)) :=
    fun S ↦ ⟨S.boundary, S.clique, S.indep⟩
  apply Finite.of_injective f
  intro S T h
  cases S
  cases T
  cases h
  rfl

/-- A finite state space can be enumerated noncomputably. -/
public noncomputable instance fintypeProfile [Fintype B] : Fintype (Profile B p q) :=
  Fintype.ofFinite _

/-- Whole-graph homogeneity is exactly boundary homogeneity and interior eligibility. -/
public theorem homogeneous_disjSum_iff (G : SimpleGraph (B ⊕ X)) (k : Bool)
    (U : Finset B) (S : Finset X) :
    Homogeneous G k (U.disjSum S) ↔
      Homogeneous (boundaryGraph G) k U ∧ Eligible G k U S := by
  constructor
  · intro h
    refine ⟨?_, ?_, ?_⟩
    · intro a ha b hb hab
      exact (colourAdj_comap G k Sum.inl Sum.inl_injective a b).2
        (h _ (by simpa using ha) _ (by simpa using hb) (by simpa using hab))
    · intro a ha b hb hab
      exact (colourAdj_comap G k Sum.inr Sum.inr_injective a b).2
        (h _ (by simpa using ha) _ (by simpa using hb) (by simpa using hab))
    · intro u hu x hx
      exact h _ (by simpa using hu) _ (by simpa using hx) (by simp)
  · rintro ⟨hU, hS, hc⟩ (a | a) ha (b | b) hb hab
    · exact (colourAdj_comap G k Sum.inl Sum.inl_injective a b).1
        (hU _ (by simpa using ha) _ (by simpa using hb) (by simpa using hab))
    · exact hc _ (by simpa using ha) _ (by simpa using hb)
    · exact colourAdj_symm G k (hc _ (by simpa using hb) _ (by simpa using ha))
    · exact (colourAdj_comap G k Sum.inr Sum.inr_injective a b).1
        (hS _ (by simpa using ha) _ (by simpa using hb) (by simpa using hab))

/-- The actual whole-graph maximum is attained by a homogeneous finite set. -/
public lemma exists_homogeneousNumber [Fintype V] (G : SimpleGraph V) (k : Bool) :
    ∃ S, Homogeneous G k S ∧ S.card = homogeneousNumber G k :=
  exists_maxCard ⟨∅, homogeneous_empty G k⟩

/-- A homogeneous finite set is bounded by the actual whole-graph maximum. -/
public lemma le_homogeneousNumber [Fintype V] {G : SimpleGraph V} {k : Bool}
    {S : Finset V} (hS : Homogeneous G k S) : S.card ≤ homogeneousNumber G k :=
  le_maxCard hS

/-- Boundary candidates compute the exact capped whole-graph maximum in either colour. -/
public theorem capped_homogeneousNumber [Fintype B] [Fintype X]
    (G : SimpleGraph (B ⊕ X)) (k : Bool) (t : ℕ) :
    min t (homogeneousNumber G k) =
      Finset.univ.sup (fun U : {U : Finset B // Homogeneous (boundaryGraph G) k U} ↦
        min t (U.val.card + entry G k t U.val)) := by
  classical
  apply le_antisymm
  · obtain ⟨S, hS, he⟩ := exists_homogeneousNumber G k
    have hd := (homogeneous_disjSum_iff G k S.toLeft S.toRight).1
      (by simpa only [Finset.toLeft_disjSum_toRight] using hS)
    let U : {U : Finset B // Homogeneous (boundaryGraph G) k U} := ⟨S.toLeft, hd.1⟩
    have hc := le_rawEntry hd.2
    have hu := Finset.le_sup (f := fun U :
      {U : Finset B // Homogeneous (boundaryGraph G) k U} ↦
        min t (U.val.card + entry G k t U.val)) (Finset.mem_univ U)
    have hcard := S.card_toLeft_add_card_toRight
    dsimp [U, entry] at hu
    rw [cap_add] at hu
    exact (min_le_min_left t (by omega : homogeneousNumber G k ≤
      S.toLeft.card + rawEntry G k S.toLeft)).trans hu
  · apply Finset.sup_le
    intro U _
    obtain ⟨S, hS, he⟩ := exists_rawEntry G k U.val
    have hh := le_homogeneousNumber ((homogeneous_disjSum_iff G k U.val S).2
      ⟨U.property, hS⟩)
    simp only [Finset.card_disjSum, he] at hh
    simpa only [entry, cap_add] using min_le_min_left t hh

/-- The state observation equals the appropriate clipped whole-graph homogeneous number. -/
public theorem observed_profile [Fintype B] [Fintype X]
    (G : SimpleGraph (B ⊕ X)) (p q : ℕ) (k : Bool) :
    observed (profile G p q) k = min (if k then p else q) (homogeneousNumber G k) := by
  cases k
  · simp only [observed, profile, Bool.false_eq_true, ↓reduceDIte, ↓reduceIte]
    convert (capped_homogeneousNumber G false q).symm using 1
    congr 1
  · simp only [observed, profile, ↓reduceDIte, ↓reduceIte]
    convert (capped_homogeneousNumber G true p).symm using 1
    congr 1

/-- Equal profiles preserve the exact capped whole-graph maxima in both colours. -/
public theorem sameProfile_capped_homogeneousNumber [Fintype B] [Fintype X] [Fintype Y]
    {G : SimpleGraph (B ⊕ X)} {F : SimpleGraph (B ⊕ Y)}
    (h : SameProfile G F p q) (k : Bool) :
    min (if k then p else q) (homogeneousNumber G k) =
      min (if k then p else q) (homogeneousNumber F k) := by
  rw [← observed_profile G p q k, ← observed_profile F p q k]
  exact congrArg (fun S ↦ observed S k) h

/-- The clique colour is the standard finite-set clique predicate. -/
public lemma homogeneous_true_iff (G : SimpleGraph V) (S : Finset V) :
    Homogeneous G true S ↔ G.IsClique (S : Set V) := Iff.rfl

/-- The independent colour is the standard clique predicate in the complement. -/
public lemma homogeneous_false_iff (G : SimpleGraph V) (S : Finset V) :
    Homogeneous G false S ↔ Gᶜ.IsClique (S : Set V) := Iff.rfl

/-- Standard clique exclusion is exactly a strict bound on the concrete clique maximum. -/
public theorem cliqueFree_iff_homogeneousNumber_lt [Fintype V] (G : SimpleGraph V) (t : ℕ) :
    G.CliqueFree t ↔ homogeneousNumber G true < t := by
  constructor
  · intro h
    obtain ⟨S, hS, he⟩ := exists_homogeneousNumber G true
    by_contra hn
    obtain ⟨T, hTS, hT⟩ := Finset.exists_subset_card_eq (by omega : t ≤ S.card)
    exact h T ⟨(homogeneous_true_iff G T).1 (hS.mono hTS), hT⟩
  · intro h S hS
    have hh := le_homogeneousNumber ((homogeneous_true_iff G S).2 hS.isClique)
    have he := hS.card_eq
    omega

/-- Complementing changes the independent maximum into the clique maximum. -/
public lemma homogeneousNumber_false [Fintype V] (G : SimpleGraph V) :
    homogeneousNumber G false = homogeneousNumber Gᶜ true := by
  unfold homogeneousNumber
  congr 1

/-- Ramsey freeness is exactly simultaneous strict bounds on both actual maxima. -/
public theorem isRamseyGraph_iff_homogeneousNumber_lt [Fintype V]
    (G : SimpleGraph V) (p q : ℕ) :
    IsRamseyGraph p q G ↔ homogeneousNumber G true < p ∧ homogeneousNumber G false < q := by
  rw [IsRamseyGraph, ← SimpleGraph.cliqueFree_compl, cliqueFree_iff_homogeneousNumber_lt,
    cliqueFree_iff_homogeneousNumber_lt, homogeneousNumber_false]

/-- A strict whole-graph bound is equivalent to every homogeneous boundary candidate bound. -/
public theorem homogeneousNumber_lt_iff [Fintype B] [Fintype X]
    (G : SimpleGraph (B ⊕ X)) (k : Bool) (t : ℕ) :
    homogeneousNumber G k < t ↔
      ∀ U, Homogeneous (boundaryGraph G) k U → U.card + entry G k t U < t := by
  constructor
  · intro h U hU
    obtain ⟨S, hS, he⟩ := exists_rawEntry G k U
    have hh := le_homogeneousNumber ((homogeneous_disjSum_iff G k U S).2 ⟨hU, hS⟩)
    simp only [Finset.card_disjSum, he] at hh
    dsimp [entry]
    omega
  · intro h
    obtain ⟨S, hS, he⟩ := exists_homogeneousNumber G k
    have hd := (homogeneous_disjSum_iff G k S.toLeft S.toRight).1
      (by simpa only [Finset.toLeft_disjSum_toRight] using hS)
    have hu := h S.toLeft hd.1
    have hc := le_rawEntry hd.2
    have hcard := S.card_toLeft_add_card_toRight
    dsimp [entry] at hu
    omega

/-- The finite profile detects Ramsey freeness by precisely the two boundary table tests. -/
public theorem isRamseyGraph_iff_candidates [Fintype B] [Fintype X]
    (G : SimpleGraph (B ⊕ X)) (p q : ℕ) :
    IsRamseyGraph p q G ↔
      (∀ U, Homogeneous (boundaryGraph G) true U → U.card + entry G true p U < p) ∧
      (∀ U, Homogeneous (boundaryGraph G) false U → U.card + entry G false q U < q) := by
  rw [isRamseyGraph_iff_homogeneousNumber_lt, homogeneousNumber_lt_iff,
    homogeneousNumber_lt_iff]

/-- Equal profiles preserve Ramsey freeness even when the graph orders differ. -/
public theorem sameProfile_isRamseyGraph [Fintype B] [Fintype X] [Fintype Y]
    {G : SimpleGraph (B ⊕ X)} {F : SimpleGraph (B ⊕ Y)}
    (h : SameProfile G F p q) : IsRamseyGraph p q G ↔ IsRamseyGraph p q F := by
  rw [isRamseyGraph_iff_homogeneousNumber_lt, isRamseyGraph_iff_homogeneousNumber_lt]
  have hc := sameProfile_capped_homogeneousNumber h true
  have hi := sameProfile_capped_homogeneousNumber h false
  simp only [Bool.false_eq_true, ↓reduceIte] at hc hi
  omega

/-- Profile equality is symmetric across different interior types. -/
public lemma SameProfile.symm [Fintype X] [Fintype Y]
    {G : SimpleGraph (B ⊕ X)} {F : SimpleGraph (B ⊕ Y)}
    (h : SameProfile G F p q) : SameProfile F G p q := Eq.symm h

/-- Profile equality is transitive across different interior types. -/
public lemma SameProfile.trans [Fintype X] [Fintype Y] {Z : Type*} [Fintype Z]
    {G : SimpleGraph (B ⊕ X)} {F : SimpleGraph (B ⊕ Y)} {K : SimpleGraph (B ⊕ Z)}
    (h : SameProfile G F p q) (h' : SameProfile F K p q) : SameProfile G K p q := Eq.trans h h'

/-- Equal profiles retain exactly equal labelled boundary graphs. -/
public lemma SameProfile.boundary_eq [Fintype X] [Fintype Y]
    {G : SimpleGraph (B ⊕ X)} {F : SimpleGraph (B ⊕ Y)} (h : SameProfile G F p q) :
    boundaryGraph G = boundaryGraph F := (profile_eq_iff G F).1 h |>.1

/-- A zero positive-threshold entry means exactly that no eligible interior vertex exists. -/
public theorem entry_eq_zero_iff [Fintype X] (G : SimpleGraph (B ⊕ X)) (k : Bool)
    (t : ℕ) (ht : 0 < t) (U : Finset B) : entry G k t U = 0 ↔
      ¬∃ x, ∀ u ∈ U, colourAdj G k (Sum.inl u) (Sum.inr x) := by
  constructor
  · intro h ⟨x, hx⟩
    have he : Eligible G k U {x} := ⟨homogeneous_singleton _ _ _, by simpa using hx⟩
    have hc := le_rawEntry he
    simp only [Finset.card_singleton] at hc
    dsimp [entry] at h
    omega
  · intro h
    have hr : rawEntry G k U = 0 := by
      apply Nat.eq_zero_of_le_zero
      apply rawEntry_le
      intro S hS
      have hs : S = ∅ := by
        apply Finset.eq_empty_iff_forall_notMem.2
        intro x hx
        exact h ⟨x, fun u hu ↦ hS.2 u hu x hx⟩
      simp [hs]
    simp [entry, hr]

/-- A boundary candidate of residual size `0` already reaches the threshold. -/
public lemma boundary_reaches_threshold [Fintype X] (G : SimpleGraph (B ⊕ X)) (k : Bool)
    (t : ℕ) (U : Finset B) (hU : t ≤ U.card) : t ≤ U.card + entry G k t U := by omega

/-- At residual size `1`, the strict candidate test is exactly the zero-entry test. -/
public lemma residual_one_iff [Fintype X] (G : SimpleGraph (B ⊕ X)) (k : Bool)
    (t : ℕ) (U : Finset B) (hU : U.card + 1 = t) :
    U.card + entry G k t U < t ↔ entry G k t U = 0 := by omega

/-- Threshold `1` excludes every nonempty graph in either colour. -/
public theorem homogeneousNumber_lt_one_iff [Fintype V] (G : SimpleGraph V) (k : Bool) :
    homogeneousNumber G k < 1 ↔ IsEmpty V := by
  constructor
  · intro h
    refine ⟨fun v ↦ ?_⟩
    have hc := le_homogeneousNumber (homogeneous_singleton G k v)
    simp only [Finset.card_singleton] at hc
    omega
  · intro h
    obtain ⟨S, _, he⟩ := exists_homogeneousNumber G k
    have hs : S = ∅ := Finset.eq_empty_iff_forall_notMem.2 (fun v _ ↦ h.false v)
    simp [hs] at he
    omega

/-- The concrete clique maximum agrees with the standard graph clique number. -/
public theorem homogeneousNumber_true_eq_cliqueNum [Fintype V] (G : SimpleGraph V) :
    homogeneousNumber G true = G.cliqueNum := by
  apply le_antisymm
  · obtain ⟨S, hS, he⟩ := exists_homogeneousNumber G true
    exact he ▸ ((homogeneous_true_iff G S).1 hS).card_le_cliqueNum
  · obtain ⟨S, hS⟩ := G.exists_isNClique_cliqueNum
    exact hS.card_eq ▸ le_homogeneousNumber ((homogeneous_true_iff G S).2 hS.isClique)

/-- The concrete independent maximum agrees with the standard graph independence number. -/
public theorem homogeneousNumber_false_eq_indepNum [Fintype V] (G : SimpleGraph V) :
    homogeneousNumber G false = G.indepNum := by
  rw [homogeneousNumber_false, homogeneousNumber_true_eq_cliqueNum,
    SimpleGraph.cliqueNum_compl]

/-- Labelled graphs inject into subsets of the edges of the complete graph. -/
private lemma card_graph_le [Fintype B] :
    Fintype.card (SimpleGraph B) ≤ 2 ^ (Fintype.card B).choose 2 := by
  let f : SimpleGraph B → Set (⊤ : SimpleGraph B).edgeSet :=
    fun H ↦ {e | e.val ∈ H.edgeSet}
  have hf : Function.Injective f := by
    intro H K h
    apply SimpleGraph.edgeSet_injective
    ext e
    by_cases he : e ∈ (⊤ : SimpleGraph B).edgeSet
    · exact congrArg (fun S : Set (⊤ : SimpleGraph B).edgeSet ↦ (⟨e, he⟩ :
        (⊤ : SimpleGraph B).edgeSet) ∈ S) h |> eq_iff_iff.mp
    · have hH : e ∉ H.edgeSet := fun hE ↦
        he (SimpleGraph.edgeSet_mono (show H ≤ ⊤ from le_top) hE)
      have hK : e ∉ K.edgeSet := fun hE ↦
        he (SimpleGraph.edgeSet_mono (show K ≤ ⊤ from le_top) hE)
      simp [hH, hK]
  have hc := Fintype.card_le_of_injective f hf
  simpa only [Fintype.card_set, SimpleGraph.card_edgeSet,
    SimpleGraph.card_edgeFinset_top_eq_card_choose_two] using hc

/-- Completing invalid arguments by `0` bounds the number of dependent-domain states. -/
private lemma card_profile_le_tables [Fintype B] :
    Fintype.card (Profile B p q) ≤ Fintype.card (SimpleGraph B) *
      (p + 1) ^ (2 ^ Fintype.card B) * (q + 1) ^ (2 ^ Fintype.card B) := by
  let c : Profile B p q → Finset B → Fin (p + 1) := fun S U ↦
    if h : Homogeneous S.boundary true U then S.clique ⟨U, h⟩ else 0
  let a : Profile B p q → Finset B → Fin (q + 1) := fun S U ↦
    if h : Homogeneous S.boundary false U then S.indep ⟨U, h⟩ else 0
  let f : Profile B p q → SimpleGraph B ×
      (Finset B → Fin (p + 1)) × (Finset B → Fin (q + 1)) :=
    fun S ↦ ⟨S.boundary, c S, a S⟩
  have hf : Function.Injective f := by
    intro S T h
    have hb : S.boundary = T.boundary := congrArg Prod.fst h
    apply profile_struct_ext hb
    · intro U hS hT
      have hc := congrArg (fun z ↦ (z.2.1 U).val) h
      simpa only [f, c, dite_eq_left hS, dite_eq_left hT] using hc
    · intro U hS hT
      have hi := congrArg (fun z ↦ (z.2.2 U).val) h
      simpa only [f, a, dite_eq_left hS, dite_eq_left hT] using hi
  have hc := Fintype.card_le_of_injective f hf
  simpa only [Fintype.card_prod, Fintype.card_fun, Fintype.card_fin,
    Fintype.card_finset, Nat.mul_assoc] using hc

/-- The finite profile state space satisfies the explicit labelled-boundary counting bound. -/
public theorem card_profile_le [Fintype B] (p q : ℕ) :
    Fintype.card (Profile B p q) ≤
      2 ^ (Fintype.card B * (Fintype.card B - 1) / 2) *
        (p + 1) ^ (2 ^ Fintype.card B) * (q + 1) ^ (2 ^ Fintype.card B) := by
  have hg := card_graph_le (B := B)
  rw [Nat.choose_two_right] at hg
  exact card_profile_le_tables.trans
    (Nat.mul_le_mul_right _ (Nat.mul_le_mul_right _ hg))

/-- The empty boundary argument gives exactly the capped interior homogeneous number. -/
public theorem entry_empty [Fintype X] (G : SimpleGraph (B ⊕ X)) (k : Bool) (t : ℕ) :
    entry G k t ∅ = min t (homogeneousNumber (G.comap Sum.inr) k) := by
  unfold entry rawEntry homogeneousNumber
  congr 2
  funext S
  simp [Eligible]

/-- An empty interior has zero table entries in both colours and at every threshold. -/
public theorem entry_of_isEmpty [Fintype X] [IsEmpty X]
    (G : SimpleGraph (B ⊕ X)) (k : Bool) (t : ℕ) (U : Finset B) : entry G k t U = 0 := by
  obtain ⟨S, _, he⟩ := exists_rawEntry G k U
  have hs : S = ∅ := Finset.eq_empty_of_isEmpty S
  simp [hs] at he
  simp [entry, ← he]

end Ramsey.Boundary
