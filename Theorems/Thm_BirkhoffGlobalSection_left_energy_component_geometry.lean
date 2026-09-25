import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

open scoped ContDiff

/-- Below the first critical value, the selected Levi-Civita component is a
compact regular hypersurface with an antipodally equivariant sphere model. -/
theorem left_energy_component_geometry (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    IsCompact (leftEnergyComponent μ c) ∧
    (∀ s ∈ leftEnergyComponent μ c,
      ContDiffAt ℝ ∞ (leviCivitaHamiltonian μ c) s ∧
      fderiv ℝ (leviCivitaHamiltonian μ c) s ≠ 0) ∧
    IsAntipodallyInvariantComponent μ c ∧
    IsAntipodallyFreeComponent μ c ∧
    ∃ e : LeftEnergyState μ c ≃ₜ
        {x : Phase // x ∈ unitThreeSphere},
      IsAntipodallyEquivariantSphereHomeomorph e := by sorry

end BirkhoffGlobalSection
