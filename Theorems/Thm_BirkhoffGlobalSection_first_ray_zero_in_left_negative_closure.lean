import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem first_ray_zero_in_left_negative_closure (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (x : Phase) (r : ℝ) (hr : 0 < r)
    (hnegative : ∀ t : ℝ, 0 ≤ t → t < r →
      leviCivitaHamiltonian μ c (fun i : Fin 4 => t * x i) < 0)
    (hfree : ∀ t : ℝ, 0 ≤ t → t ≤ r →
      0 < secondCollisionDistanceSq (fun i : Fin 4 => t * x i)) :
    (fun i : Fin 4 => r * x i) ∈ closure
      (connectedComponentIn
        {s : Phase | leviCivitaHamiltonian μ c s < 0 ∧
          0 < secondCollisionDistanceSq s}
        (fun _ : Fin 4 => (0 : ℝ))) := by sorry

end BirkhoffGlobalSection
