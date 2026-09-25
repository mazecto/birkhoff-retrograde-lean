import Definitions.Def_BirkhoffShootingArcs

namespace BirkhoffGlobalSection

theorem birkhoff_far_arc_continuity (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c)
    (φ : Flow ℝ (LeftEnergyState μ c))
    (hφ : IsLeviCivitaHamiltonianFlow μ c φ)
    (r₀ : ℝ) (hr₀ : 0 < r₀) (x₀ : LeftEnergyState μ c) (τ₀ : ℝ)
    (hx₀ : (x₀ : Phase) = farShootingStart μ c r₀) (harc : IsFarShootingArc φ x₀ τ₀) :
    ∀ ε > 0, ∃ δ > 0, ∀ r : ℝ, |r - r₀| < δ →
      ∃ x : LeftEnergyState μ c, (x : Phase) = farShootingStart μ c r ∧ ∃ τ : ℝ, IsFarShootingArc φ x τ ∧
        dist (shootingCoordinates μ ((φ τ x : LeftEnergyState μ c) : Phase))
          (shootingCoordinates μ ((φ τ₀ x₀ : LeftEnergyState μ c) : Phase)) < ε := by sorry

end BirkhoffGlobalSection
