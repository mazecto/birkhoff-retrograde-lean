import Theorems.Thm_BirkhoffGlobalSection_left_negative_closure_position_coordinates_bounded
import Theorems.Thm_BirkhoffGlobalSection_left_negative_closure_uniform_collision_gap
import Theorems.Thm_BirkhoffGlobalSection_left_negative_closure_nonpositive_energy
import Theorems.Thm_BirkhoffGlobalSection_nonpositive_regular_energy_momentum_bound

open BirkhoffGlobalSection

theorem solution (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∃ R : ℝ, ∀ s ∈ closure
      (connectedComponentIn
        {t : Phase | leviCivitaHamiltonian μ c t < 0 ∧
          0 < secondCollisionDistanceSq t}
        (fun _ : Fin 4 => (0 : ℝ))),
      |s 2| ≤ R ∧ |s 3| ≤ R := by
  obtain ⟨P, hP⟩ :=
    left_negative_closure_position_coordinates_bounded μ c hμ0 hμ1 hc
  obtain ⟨δ, hδ, hgap⟩ :=
    left_negative_closure_uniform_collision_gap μ c hμ0 hμ1 hc
  obtain ⟨M, hM⟩ :=
    nonpositive_regular_energy_momentum_bound μ c P δ hδ
  refine ⟨M, ?_⟩
  intro s hs
  exact hM s (hP s hs).1 (hP s hs).2 (hgap s hs)
    (left_negative_closure_nonpositive_energy μ c hμ0 hμ1 hc s hs)
