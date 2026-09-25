import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem nonvertical_ray_reaches_inner_circle
    (r : ℝ) (hr : 0 < r) (hr1 : r < 1)
    (x : Phase) (hx : 0 < zNormSq x) :
    ∃ R : ℝ, 0 < R ∧
      ((leviCivitaPosition 0 (fun i : Fin 4 => R * x i)) 0) ^ 2 +
        ((leviCivitaPosition 0 (fun i : Fin 4 => R * x i)) 1) ^ 2 = r ^ 2 ∧
      ∀ t : ℝ, 0 ≤ t → t ≤ R →
        0 < secondCollisionDistanceSq (fun i : Fin 4 => t * x i) := by sorry

end BirkhoffGlobalSection
