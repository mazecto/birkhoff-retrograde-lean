import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- An existential, labeled-primary formulation of Birkhoff's retrograde-orbit
global-section problem. The rational page and all return conditions are stated
in the antipodal quotient, using a smooth Levi-Civita lift. -/
theorem birkhoff_retrograde_global_section (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c)
    (φ : Flow ℝ (LeftEnergyState μ c))
    (hφ : IsLeviCivitaHamiltonianFlow μ c φ)
    (hanti : IsAntipodallyEquivariantFlow μ c φ) :
    ∃ δ : AntipodalPeriodicTrajectory φ,
      IsGeometricBirkhoffRetrogradeTrajectory φ δ ∧
        RationalDiskLikeGlobalSurfaceOfSection φ hanti
          (antipodalTrajectoryDoubleLift φ hanti δ) := by sorry

end BirkhoffGlobalSection
