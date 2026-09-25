import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- At subcritical energy, the regularized momentum coordinates of the
selected component admit a uniform bound depending on the parameters. -/
theorem left_component_momentum_coordinates_bounded (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∃ Rw : ℝ, ∀ s ∈ leftEnergyComponent μ c,
      |s 2| ≤ Rw ∧ |s 3| ≤ Rw := by sorry

end BirkhoffGlobalSection
