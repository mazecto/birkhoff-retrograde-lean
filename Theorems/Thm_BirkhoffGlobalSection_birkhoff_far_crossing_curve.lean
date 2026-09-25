import Definitions.Def_BirkhoffShootingCoordinates
import Mathlib.Order.Filter.Basic
import Mathlib.Topology.Order.Basic

namespace BirkhoffGlobalSection

theorem birkhoff_far_crossing_curve (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c)
    (φ : Flow ℝ (LeftEnergyState μ c))
    (hφ : IsLeviCivitaHamiltonianFlow μ c φ) :
    ∃ b : ℝ, 0 < b ∧ ∃ E : ℝ × ℝ,
      (((E.1 = -1 ∨ E.1 = 1) ∧ 0 < E.2) ∨ (E.2 = 0 ∧ Real.sqrt 2 / 2 < E.1)) ∧
      ∃ S : ℝ → LeftEnergyState μ c, ∃ T : ℝ → ℝ,
        ContinuousOn (fun r : ℝ =>
          shootingCoordinates μ ((φ (T r) (S r) : LeftEnergyState μ c) : Phase)) (Set.Ioo 0 b) ∧
        Filter.Tendsto (fun r : ℝ =>
          shootingCoordinates μ ((φ (T r) (S r) : LeftEnergyState μ c) : Phase))
          (nhdsWithin 0 (Set.Ioi 0)) (nhds (-(Real.sqrt 2 / 2), 0)) ∧
        Filter.Tendsto (fun r : ℝ =>
          shootingCoordinates μ ((φ (T r) (S r) : LeftEnergyState μ c) : Phase))
          (nhdsWithin b (Set.Iio b)) (nhds E) ∧
        ∀ r ∈ Set.Ioo 0 b,
          ((S r : LeftEnergyState μ c) : Phase) 0 = 0 ∧
          ((S r : LeftEnergyState μ c) : Phase) 3 = 0 ∧
          ((S r : LeftEnergyState μ c) : Phase) 1 ≠ 0 ∧
          0 < T r ∧
          (∀ u ∈ Set.Ioo 0 (T r),
            relativePosition μ ((φ u (S r) : LeftEnergyState μ c) : Phase) 1 < 0) ∧
          relativePosition μ ((φ (T r) (S r) : LeftEnergyState μ c) : Phase) 1 < 0 ∧
          StrictMonoOn
            (fun u : ℝ => relativePosition μ ((φ u (S r) : LeftEnergyState μ c) : Phase) 0)
            (Set.Icc 0 (T r)) ∧
          relativePosition μ ((φ (T r) (S r) : LeftEnergyState μ c) : Phase) 0 = 0 ∧
          0 < jacobiVelocity
            (leviCivitaToJacobi μ ((φ (T r) (S r) : LeftEnergyState μ c) : Phase)) 0 := by sorry

end BirkhoffGlobalSection
