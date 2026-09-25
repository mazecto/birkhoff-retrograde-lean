import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- The subcritical Levi-Civita energy component contains no stationary
point of the regularized Hamiltonian. -/
theorem left_energy_component_regular (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∀ s ∈ leftEnergyComponent μ c,
      fderiv ℝ (leviCivitaHamiltonian μ c) s ≠ 0 := by sorry

end BirkhoffGlobalSection
