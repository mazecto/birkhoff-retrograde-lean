import Theorems.Thm_BirkhoffGlobalSection_near_equal_mass_birkhoff_rational_global_section
import Theorems.Thm_BirkhoffGlobalSection_away_from_equal_mass_retrograde_global_section

open BirkhoffGlobalSection

theorem solution (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c)
    (φ : Flow ℝ (LeftEnergyState μ c))
    (hφ : IsLeviCivitaHamiltonianFlow μ c φ)
    (hanti : IsAntipodallyEquivariantFlow μ c φ) :
    ∃ δ : AntipodalPeriodicTrajectory φ,
      IsGeometricBirkhoffRetrogradeTrajectory φ δ ∧
        RationalDiskLikeGlobalSurfaceOfSection φ hanti
          (antipodalTrajectoryDoubleLift φ hanti δ) := by
  obtain ⟨ε, hε0, hε1, hnear⟩ :=
    near_equal_mass_birkhoff_rational_global_section
  by_cases h : |μ - 1 / 2| < ε
  · exact hnear μ c hμ0 hμ1 h hc φ hφ hanti
  · exact away_from_equal_mass_retrograde_global_section
      ε hε0 hε1 μ c hμ0 hμ1 (le_of_not_gt h) hc φ hφ hanti

