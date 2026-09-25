import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- The as-yet unresolved parameter region outside any chosen near-equal-mass
interval. This is the complementary subcase of the universal conjecture. -/
theorem away_from_equal_mass_retrograde_global_section
    (ε : ℝ) (hε0 : 0 < ε) (hε1 : ε ≤ 1 / 2)
    (μ c : ℝ) (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (haway : ε ≤ |μ - 1 / 2|)
    (hc : belowFirstCriticalValue μ c)
    (φ : Flow ℝ (LeftEnergyState μ c))
    (hφ : IsLeviCivitaHamiltonianFlow μ c φ)
    (hanti : IsAntipodallyEquivariantFlow μ c φ) :
    ∃ δ : AntipodalPeriodicTrajectory φ,
      IsGeometricBirkhoffRetrogradeTrajectory φ δ ∧
        RationalDiskLikeGlobalSurfaceOfSection φ hanti
          (antipodalTrajectoryDoubleLift φ hanti δ) := by sorry

end BirkhoffGlobalSection
