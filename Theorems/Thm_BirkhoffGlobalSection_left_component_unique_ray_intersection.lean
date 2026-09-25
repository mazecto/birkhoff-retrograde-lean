import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- Every direction meets the selected star-shaped component in exactly one
positive radial point, so any map with the radial formula is bijective. -/
theorem left_component_unique_ray_intersection (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c)
    (f : LeftEnergyState μ c → {x : Phase // x ∈ unitThreeSphere})
    (hrad : ∀ s, (f s : Phase) =
      fun i => (s : Phase) i /
        Real.sqrt (zNormSq (s : Phase) + wNormSq (s : Phase))) :
    Function.Bijective f := by sorry

end BirkhoffGlobalSection
