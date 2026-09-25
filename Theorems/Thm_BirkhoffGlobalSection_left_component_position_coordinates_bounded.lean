import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- At subcritical energy, the regularized position coordinates of the
selected component admit a uniform bound depending on the parameters. -/
theorem left_component_position_coordinates_bounded (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∃ Rz : ℝ, ∀ s ∈ leftEnergyComponent μ c,
      |s 0| ≤ Rz ∧ |s 1| ≤ Rz := by sorry

end BirkhoffGlobalSection
