import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- Radial normalization of the nonzero states on the selected component
lands on the unit sphere and varies continuously. -/
theorem left_component_radial_projection_continuous (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∃ f : LeftEnergyState μ c → {x : Phase // x ∈ unitThreeSphere},
      Continuous f ∧
        ∀ s, (f s : Phase) =
          fun i => (s : Phase) i /
            Real.sqrt (zNormSq (s : Phase) + wNormSq (s : Phase)) := by sorry

end BirkhoffGlobalSection
