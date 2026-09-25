import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- The designated regularized collision point lies on the selected component
for physical mass parameters. -/
theorem leftCollisionPoint_mem_leftEnergyComponent (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) :
    leftCollisionPoint μ ∈ leftEnergyComponent μ c := by sorry

end BirkhoffGlobalSection
