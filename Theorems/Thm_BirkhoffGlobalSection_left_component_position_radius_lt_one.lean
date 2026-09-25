import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem left_component_position_radius_lt_one (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∃ ρ : ℝ, ρ < 1 ∧ ∀ s ∈ leftEnergyComponent μ c,
      ((leviCivitaPosition μ s) 0 + μ) ^ 2 +
        ((leviCivitaPosition μ s) 1) ^ 2 ≤ ρ := by sorry

end BirkhoffGlobalSection
