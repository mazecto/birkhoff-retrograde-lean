import Mathlib.Topology.MetricSpace.Bounded
import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- The selected subcritical component has uniformly bounded Levi-Civita
position and momentum coordinates. -/
theorem left_energy_component_bounded (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    Bornology.IsBounded (leftEnergyComponent μ c) := by sorry

end BirkhoffGlobalSection
