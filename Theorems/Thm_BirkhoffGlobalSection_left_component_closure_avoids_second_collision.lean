import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- A limit of points on the selected subcritical component cannot meet the
second collision, where Levi-Civita regularization is singular. -/
theorem left_component_closure_avoids_second_collision (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∀ s ∈ closure (leftEnergyComponent μ c),
      0 < secondCollisionDistanceSq s := by sorry

end BirkhoffGlobalSection
