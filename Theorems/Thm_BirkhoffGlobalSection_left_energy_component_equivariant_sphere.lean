import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- The star-shaped subcritical component has an antipodally equivariant
radial model by the round three-sphere. -/
theorem left_energy_component_equivariant_sphere (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∃ e : LeftEnergyState μ c ≃ₜ {x : Phase // x ∈ unitThreeSphere},
      IsAntipodallyEquivariantSphereHomeomorph e := by sorry

end BirkhoffGlobalSection
