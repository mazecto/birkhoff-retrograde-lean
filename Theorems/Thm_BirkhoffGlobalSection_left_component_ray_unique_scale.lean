import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem left_component_ray_unique_scale (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∀ x ∈ unitThreeSphere, ∀ r t : ℝ,
      0 < r → 0 < t →
      (fun i : Fin 4 => r * x i) ∈ leftEnergyComponent μ c →
      (fun i : Fin 4 => t * x i) ∈ leftEnergyComponent μ c →
      r = t := by sorry

end BirkhoffGlobalSection
