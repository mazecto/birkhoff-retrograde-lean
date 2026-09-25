import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem inner_lagrange_subcritical_circle_forbidden (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∃ r : ℝ, 0 < r ∧ r < 1 ∧
      ∀ s ∈ regularEnergyLocus μ c,
        ((leviCivitaPosition μ s) 0 + μ) ^ 2 +
          ((leviCivitaPosition μ s) 1) ^ 2 ≠ r ^ 2 := by sorry

end BirkhoffGlobalSection
