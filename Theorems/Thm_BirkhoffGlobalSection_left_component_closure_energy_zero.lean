import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- On the closure of the selected component, the regularized energy equation
still holds; collision exclusion allows continuity of the Hamiltonian there. -/
theorem left_component_closure_energy_zero (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∀ s ∈ closure (leftEnergyComponent μ c),
      leviCivitaHamiltonian μ c s = 0 := by sorry

end BirkhoffGlobalSection
