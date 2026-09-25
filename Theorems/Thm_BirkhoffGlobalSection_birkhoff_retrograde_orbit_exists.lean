import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- Liu--Salomão, Theorem 5.1 (attributed there to Birkhoff), together with
their 2-unknotted description and the Levi-Civita covering interpretation of
Joung--van Koert, Proposition 2.4. -/
theorem birkhoff_retrograde_orbit_exists (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c)
    (φ : Flow ℝ (LeftEnergyState μ c))
    (hφ : IsLeviCivitaHamiltonianFlow μ c φ) :
    ∃ δ : AntipodalPeriodicTrajectory φ,
      IsGeometricBirkhoffRetrogradeTrajectory φ δ := by sorry

end BirkhoffGlobalSection
