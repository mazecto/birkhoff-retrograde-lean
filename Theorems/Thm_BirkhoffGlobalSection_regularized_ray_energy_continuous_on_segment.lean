import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem regularized_ray_energy_continuous_on_segment
    (μ c : ℝ) (x : Phase) (R : ℝ)
    (hfree : ∀ r : ℝ, 0 ≤ r → r ≤ R →
      0 < secondCollisionDistanceSq (fun i : Fin 4 => r * x i)) :
    ContinuousOn (fun r : ℝ => leviCivitaHamiltonian μ c
      (fun i : Fin 4 => r * x i)) (Set.Icc 0 R) := by sorry

end BirkhoffGlobalSection
