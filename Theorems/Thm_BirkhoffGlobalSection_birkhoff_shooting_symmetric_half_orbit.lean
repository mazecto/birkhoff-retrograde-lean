import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem birkhoff_shooting_symmetric_half_orbit (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c)
    (φ : Flow ℝ (LeftEnergyState μ c))
    (hφ : IsLeviCivitaHamiltonianFlow μ c φ) :
    ∃ x : LeftEnergyState μ c, ∃ τ : ℝ, 0 < τ ∧
      (x : Phase) 0 = 0 ∧ (x : Phase) 3 = 0 ∧ (x : Phase) 1 ≠ 0 ∧
      ((φ τ x : LeftEnergyState μ c) : Phase) 1 = 0 ∧
      ((φ τ x : LeftEnergyState μ c) : Phase) 2 = 0 ∧
      ((φ τ x : LeftEnergyState μ c) : Phase) 0 ≠ 0 ∧
      (∀ t ∈ Set.Ioo 0 τ,
        relativePosition μ ((φ t x : LeftEnergyState μ c) : Phase) 1 < 0) ∧
      StrictMonoOn
        (fun t : ℝ => relativePosition μ ((φ t x : LeftEnergyState μ c) : Phase) 0)
        (Set.Icc 0 τ) := by sorry

end BirkhoffGlobalSection
