import Definitions.Def_BirkhoffShootingCoordinates

namespace BirkhoffGlobalSection

theorem birkhoff_near_shooting_family (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c)
    (φ : Flow ℝ (LeftEnergyState μ c))
    (hφ : IsLeviCivitaHamiltonianFlow μ c φ) :
    ∃ Γ : ℝ → ℝ × ℝ, ∃ α : ℝ, -1 < α ∧ α < -(Real.sqrt 2 / 2) ∧
      ContinuousOn Γ (Set.Icc (-1) 1) ∧
      Γ (-1) = (α, 0) ∧ Γ 1 = (Real.sqrt 2 / 2, 0) ∧
      (∀ s ∈ Set.Icc (-1 : ℝ) 1,
        -1 ≤ (Γ s).1 ∧ (Γ s).1 ≤ 1 ∧ 0 ≤ (Γ s).2 ∧ (Γ s).2 ≤ 1) ∧
      ∀ s ∈ Set.Ioo (-1 : ℝ) 1, |(Γ s).1| < 1 ∧ 0 < (Γ s).2 ∧
        ∃ x : LeftEnergyState μ c, ∃ τ : ℝ, 0 < τ ∧
          (x : Phase) 1 = 0 ∧ (x : Phase) 2 = 0 ∧ (x : Phase) 0 ≠ 0 ∧
          (∀ t ∈ Set.Ioo (-τ) 0,
            relativePosition μ ((φ t x : LeftEnergyState μ c) : Phase) 1 < 0) ∧
          StrictMonoOn
            (fun t : ℝ => relativePosition μ ((φ t x : LeftEnergyState μ c) : Phase) 0)
            (Set.Icc (-τ) 0) ∧
          relativePosition μ ((φ (-τ) x : LeftEnergyState μ c) : Phase) 0 = 0 ∧
          0 < jacobiVelocity
            (leviCivitaToJacobi μ ((φ (-τ) x : LeftEnergyState μ c) : Phase)) 0 ∧
          shootingCoordinates μ ((φ (-τ) x : LeftEnergyState μ c) : Phase) = Γ s := by sorry

end BirkhoffGlobalSection
