import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem first_ray_zero_on_left_energy_component (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c)
    (x : Phase) (hx : x ∈ unitThreeSphere)
    (r : ℝ) (hr : 0 < r)
    (hzero : leviCivitaHamiltonian μ c
      (fun i : Fin 4 => r * x i) = 0)
    (hnegative : ∀ t : ℝ, 0 ≤ t → t < r →
      leviCivitaHamiltonian μ c (fun i : Fin 4 => t * x i) < 0)
    (hfree : ∀ t : ℝ, 0 ≤ t → t ≤ r →
      0 < secondCollisionDistanceSq (fun i : Fin 4 => t * x i)) :
    (fun i : Fin 4 => r * x i) ∈ leftEnergyComponent μ c := by sorry

end BirkhoffGlobalSection
