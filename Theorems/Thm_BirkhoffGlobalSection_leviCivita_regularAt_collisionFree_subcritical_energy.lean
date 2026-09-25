import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- Away from both collisions the Levi-Civita coordinate map is locally
invertible; a critical point at subcritical energy would give a Jacobi
critical value below the first one. -/
theorem leviCivita_regularAt_collisionFree_subcritical_energy (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) (s : Phase)
    (hK : leviCivitaHamiltonian μ c s = 0)
    (hD : 0 < secondCollisionDistanceSq s)
    (hz : 0 < zNormSq s) :
    fderiv ℝ (leviCivitaHamiltonian μ c) s ≠ 0 := by sorry

end BirkhoffGlobalSection
