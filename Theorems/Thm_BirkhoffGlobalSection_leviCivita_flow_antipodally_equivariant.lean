import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem leviCivita_flow_antipodally_equivariant (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c)
    (φ : Flow ℝ (LeftEnergyState μ c))
    (hφ : IsLeviCivitaHamiltonianFlow μ c φ) :
    IsAntipodallyEquivariantFlow μ c φ := by sorry

end BirkhoffGlobalSection
