import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- The radial projection of the star-shaped subcritical component is a
continuous bijection onto the round unit three-sphere. -/
theorem left_energy_component_radial_bijection (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∃ f : LeftEnergyState μ c → {x : Phase // x ∈ unitThreeSphere},
      Continuous f ∧ Function.Bijective f ∧
        ∀ s, (f s : Phase) =
          fun i => (s : Phase) i /
            Real.sqrt (zNormSq (s : Phase) + wNormSq (s : Phase)) := by sorry

end BirkhoffGlobalSection
