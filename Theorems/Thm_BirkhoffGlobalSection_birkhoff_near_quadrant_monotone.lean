import Definitions.Def_BirkhoffShootingCoordinates

namespace BirkhoffGlobalSection

theorem birkhoff_near_quadrant_monotone (μ c : ℝ) (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c)
    (φ : Flow ℝ (LeftEnergyState μ c)) (hφ : IsLeviCivitaHamiltonianFlow μ c φ)
    (x : LeftEnergyState μ c) (τ : ℝ) (hτ : 0 < τ)
    (hx1 : (x : Phase) 1 = 0) (hx2 : (x : Phase) 2 = 0) (hx0 : (x : Phase) 0 ≠ 0)
    (hq : ∀ t ∈ Set.Ioo (-τ) 0,
      0 < relativePosition μ ((φ t x : LeftEnergyState μ c) : Phase) 0 ∧
      relativePosition μ ((φ t x : LeftEnergyState μ c) : Phase) 1 < 0)
    (hend : relativePosition μ ((φ (-τ) x : LeftEnergyState μ c) : Phase) 1 < 0) :
    StrictMonoOn
        (fun t : ℝ => relativePosition μ ((φ t x : LeftEnergyState μ c) : Phase) 0)
        (Set.Icc (-τ) 0) ∧
      0 < jacobiVelocity
        (leviCivitaToJacobi μ ((φ (-τ) x : LeftEnergyState μ c) : Phase)) 0 := by sorry

end BirkhoffGlobalSection
