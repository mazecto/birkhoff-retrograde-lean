import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- The existential single-page consequence of Liu--Salomão, Theorems 5.1 and
1.16(ii), transported to the Levi-Civita quotient model. A proof must include
the regularization and positive-time-change bridge between the two models. -/
theorem near_equal_mass_birkhoff_rational_global_section :
    ∃ ε : ℝ, 0 < ε ∧ ε ≤ 1 / 2 ∧
      ∀ μ c : ℝ, 0 < μ → μ < 1 →
        |μ - 1 / 2| < ε → belowFirstCriticalValue μ c →
        ∀ (φ : Flow ℝ (LeftEnergyState μ c)),
          IsLeviCivitaHamiltonianFlow μ c φ →
          ∀ hanti : IsAntipodallyEquivariantFlow μ c φ,
          ∃ δ : AntipodalPeriodicTrajectory φ,
            IsGeometricBirkhoffRetrogradeTrajectory φ δ ∧
              RationalDiskLikeGlobalSurfaceOfSection φ hanti
                (antipodalTrajectoryDoubleLift φ hanti δ) := by sorry

end BirkhoffGlobalSection
