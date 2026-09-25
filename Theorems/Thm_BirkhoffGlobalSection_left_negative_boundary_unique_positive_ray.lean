import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem left_negative_boundary_unique_positive_ray (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∀ x : {x : Phase // x ∈ unitThreeSphere},
      ∃! r : ℝ, 0 < r ∧
        (fun i : Fin 4 => r * (x : Phase) i) ∈
          {s : Phase | s ∈ closure
            (connectedComponentIn
              {t : Phase | leviCivitaHamiltonian μ c t < 0 ∧
                0 < secondCollisionDistanceSq t}
              (fun _ : Fin 4 => (0 : ℝ))) ∧
            leviCivitaHamiltonian μ c s = 0 ∧
            0 < secondCollisionDistanceSq s} := by sorry

end BirkhoffGlobalSection
