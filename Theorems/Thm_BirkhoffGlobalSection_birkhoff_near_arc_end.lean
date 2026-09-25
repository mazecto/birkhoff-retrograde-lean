import Definitions.Def_BirkhoffShootingArcs

namespace BirkhoffGlobalSection

theorem birkhoff_near_arc_end (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c)
    (φ : Flow ℝ (LeftEnergyState μ c))
    (hφ : IsLeviCivitaHamiltonianFlow μ c φ)
    (b : ℝ) (hb : 0 < b)
    (hgood : ∀ r ∈ Set.Ioo 0 b, ∃ x : LeftEnergyState μ c, (x : Phase) = nearShootingStart μ c r ∧ ∃ τ : ℝ, IsNearShootingArc φ x τ)
    (hbad : ¬ (∃ x : LeftEnergyState μ c, (x : Phase) = nearShootingStart μ c b ∧ ∃ τ : ℝ, IsNearShootingArc φ x τ)) :
    ∃ α : ℝ, -1 < α ∧ α < -(Real.sqrt 2 / 2) ∧
      ∀ η > 0, ∃ δ > 0, ∀ r ∈ Set.Ioo (b - δ) b, ∀ x : LeftEnergyState μ c, ∀ τ : ℝ,
        (x : Phase) = nearShootingStart μ c r → IsNearShootingArc φ x τ →
          dist (shootingCoordinates μ ((φ (-τ) x : LeftEnergyState μ c) : Phase)) (α, 0) < η := by sorry

end BirkhoffGlobalSection
