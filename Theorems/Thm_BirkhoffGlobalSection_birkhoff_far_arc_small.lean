import Definitions.Def_BirkhoffShootingArcs

namespace BirkhoffGlobalSection

theorem birkhoff_far_arc_small (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c)
    (φ : Flow ℝ (LeftEnergyState μ c))
    (hφ : IsLeviCivitaHamiltonianFlow μ c φ) :
    ∃ ε > 0, (∀ r ∈ Set.Ioo 0 ε, ∃ x : LeftEnergyState μ c, (x : Phase) = farShootingStart μ c r ∧ ∃ τ : ℝ, IsFarShootingArc φ x τ) ∧
      ∀ η > 0, ∃ δ > 0, ∀ r ∈ Set.Ioo 0 δ, ∀ x : LeftEnergyState μ c, ∀ τ : ℝ,
        (x : Phase) = farShootingStart μ c r → IsFarShootingArc φ x τ →
          dist (shootingCoordinates μ ((φ τ x : LeftEnergyState μ c) : Phase)) (-(Real.sqrt 2 / 2), 0) < η := by sorry

end BirkhoffGlobalSection
