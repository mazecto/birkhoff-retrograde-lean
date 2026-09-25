import Mathlib.Topology.MetricSpace.Bounded
import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- The selected subcritical component is closed in the full Levi-Civita
phase space, including across the excluded second-collision locus. -/
theorem left_energy_component_closed (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    IsClosed (leftEnergyComponent μ c) := by sorry

end BirkhoffGlobalSection
