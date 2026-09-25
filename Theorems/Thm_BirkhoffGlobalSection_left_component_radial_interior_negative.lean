import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem left_component_radial_interior_negative (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∀ x ∈ unitThreeSphere, ∀ R : ℝ,
      0 < R → (fun i : Fin 4 => R * x i) ∈ leftEnergyComponent μ c →
      ∀ r : ℝ, 0 < r → r < R →
        leviCivitaHamiltonian μ c (fun i : Fin 4 => r * x i) < 0 := by sorry

end BirkhoffGlobalSection
