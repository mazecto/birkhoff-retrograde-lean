import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem left_collision_point_in_negative_boundary (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) :
    leftCollisionPoint μ ∈ closure
      (connectedComponentIn
        {t : Phase | leviCivitaHamiltonian μ c t < 0 ∧
          0 < secondCollisionDistanceSq t}
        (fun _ : Fin 4 => (0 : ℝ))) ∧
      leviCivitaHamiltonian μ c (leftCollisionPoint μ) = 0 ∧
      0 < secondCollisionDistanceSq (leftCollisionPoint μ) := by sorry

end BirkhoffGlobalSection
