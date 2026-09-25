import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem left_component_second_collision_separated (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∃ δ : ℝ, 0 < δ ∧ ∀ s ∈ leftEnergyComponent μ c,
      δ ≤ Real.sqrt (secondCollisionDistanceSq s) := by sorry

end BirkhoffGlobalSection
