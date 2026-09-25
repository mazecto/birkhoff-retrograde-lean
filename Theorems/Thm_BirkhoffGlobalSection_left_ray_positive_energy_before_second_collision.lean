import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem left_ray_positive_energy_before_second_collision (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∀ x ∈ unitThreeSphere,
      ∃ R : ℝ, 0 < R ∧
        leviCivitaHamiltonian μ c (fun i : Fin 4 => R * x i) > 0 ∧
        ∀ r : ℝ, 0 ≤ r → r ≤ R →
          0 < secondCollisionDistanceSq (fun i : Fin 4 => r * x i) := by sorry

end BirkhoffGlobalSection
