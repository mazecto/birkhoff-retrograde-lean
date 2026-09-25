import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem left_negative_closure_position_radius_lt_one (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∃ ρ : ℝ, ρ < 1 ∧
      ∀ s ∈ closure
        (connectedComponentIn
          {t : Phase | leviCivitaHamiltonian μ c t < 0 ∧
            0 < secondCollisionDistanceSq t}
          (fun _ : Fin 4 => (0 : ℝ))),
        ((leviCivitaPosition μ s) 0 + μ) ^ 2 +
          ((leviCivitaPosition μ s) 1) ^ 2 ≤ ρ := by sorry

end BirkhoffGlobalSection
