import Definitions.Def_BirkhoffShootingArcs

namespace BirkhoffGlobalSection

theorem birkhoff_far_arc_end (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c)
    (φ : Flow ℝ (LeftEnergyState μ c))
    (hφ : IsLeviCivitaHamiltonianFlow μ c φ)
    (b : ℝ) (hb : 0 < b)
    (hgood : ∀ r ∈ Set.Ioo 0 b, ∃ x : LeftEnergyState μ c, (x : Phase) = farShootingStart μ c r ∧ ∃ τ : ℝ, IsFarShootingArc φ x τ)
    (hbad : ¬ (∃ x : LeftEnergyState μ c, (x : Phase) = farShootingStart μ c b ∧ ∃ τ : ℝ, IsFarShootingArc φ x τ)) :
    ∃ E : ℝ × ℝ,
      (((E.1 = -1 ∨ E.1 = 1) ∧ 0 < E.2) ∨ (E.2 = 0 ∧ Real.sqrt 2 / 2 < E.1)) ∧
      ∀ η > 0, ∃ δ > 0, ∀ r ∈ Set.Ioo (b - δ) b, ∀ x : LeftEnergyState μ c, ∀ τ : ℝ,
        (x : Phase) = farShootingStart μ c r → IsFarShootingArc φ x τ →
          dist (shootingCoordinates μ ((φ τ x : LeftEnergyState μ c) : Phase)) E < η := by sorry

end BirkhoffGlobalSection
