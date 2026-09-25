import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- The projection of the selected subcritical component to physical Jacobi
position stays within a bounded distance of the left primary. -/
theorem left_component_jacobi_position_radius_bounded (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∃ Rq : ℝ, ∀ s ∈ leftEnergyComponent μ c,
      ((leviCivitaPosition μ s) 0 + μ) ^ 2 +
        ((leviCivitaPosition μ s) 1) ^ 2 ≤ Rq := by sorry

end BirkhoffGlobalSection
