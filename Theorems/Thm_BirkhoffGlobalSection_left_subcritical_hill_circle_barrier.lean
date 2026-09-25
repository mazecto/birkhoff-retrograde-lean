import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- Below the first critical value, a circle centered on the left primary
separates its Hill lobe from the outer allowed region. -/
theorem left_subcritical_hill_circle_barrier (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∃ Rq : ℝ, 0 < Rq ∧
      ∀ s ∈ regularEnergyLocus μ c,
        ((leviCivitaPosition μ s) 0 + μ) ^ 2 +
          ((leviCivitaPosition μ s) 1) ^ 2 ≠ Rq := by sorry

end BirkhoffGlobalSection
