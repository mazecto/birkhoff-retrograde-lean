import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- Compactness of the selected subcritical Levi-Civita component. -/
theorem left_energy_component_compact (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    IsCompact (leftEnergyComponent μ c) := by sorry

end BirkhoffGlobalSection
