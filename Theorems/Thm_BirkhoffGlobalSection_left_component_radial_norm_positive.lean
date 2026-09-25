import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem left_component_radial_norm_positive (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∀ s ∈ leftEnergyComponent μ c,
      0 < zNormSq s + wNormSq s := by sorry

end BirkhoffGlobalSection
