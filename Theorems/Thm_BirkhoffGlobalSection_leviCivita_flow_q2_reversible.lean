import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem leviCivita_flow_q2_reversible (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c)
    (φ : Flow ℝ (LeftEnergyState μ c))
    (hφ : IsLeviCivitaHamiltonianFlow μ c φ) :
    ∀ t : ℝ, ∀ s₁ s₂ : LeftEnergyState μ c,
      (s₂ : Phase) = jacobiQ₂Reflection (s₁ : Phase) →
        ((φ (-t) s₂ : LeftEnergyState μ c) : Phase) =
          jacobiQ₂Reflection ((φ t s₁ : LeftEnergyState μ c) : Phase) := by sorry

end BirkhoffGlobalSection
