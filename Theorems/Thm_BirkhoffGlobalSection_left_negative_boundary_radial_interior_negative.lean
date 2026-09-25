import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem left_negative_boundary_radial_interior_negative (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∀ x : {x : Phase // x ∈ unitThreeSphere},
      ∀ r : ℝ, 0 < r →
      (fun i : Fin 4 => r * (x : Phase) i) ∈
        {s : Phase | s ∈ closure
          (connectedComponentIn
            {u : Phase | leviCivitaHamiltonian μ c u < 0 ∧
              0 < secondCollisionDistanceSq u}
            (fun _ : Fin 4 => (0 : ℝ))) ∧
          leviCivitaHamiltonian μ c s = 0 ∧
          0 < secondCollisionDistanceSq s} →
      ∀ t : ℝ, 0 ≤ t → t < r →
        leviCivitaHamiltonian μ c
          (fun i : Fin 4 => t * (x : Phase) i) < 0 := by sorry

end BirkhoffGlobalSection
