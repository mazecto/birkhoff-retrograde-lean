import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem left_negative_boundary_radial_graph (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∃ ρ : {x : Phase // x ∈ unitThreeSphere} → ℝ,
      Continuous ρ ∧
      (∀ x, 0 < ρ x) ∧
      {s : Phase | s ∈ closure
        (connectedComponentIn
          {t : Phase | leviCivitaHamiltonian μ c t < 0 ∧
            0 < secondCollisionDistanceSq t}
          (fun _ : Fin 4 => (0 : ℝ))) ∧
        leviCivitaHamiltonian μ c s = 0 ∧
        0 < secondCollisionDistanceSq s} =
        Set.range (fun x : {x : Phase // x ∈ unitThreeSphere} =>
          (fun i : Fin 4 => ρ x * (x : Phase) i)) := by sorry

end BirkhoffGlobalSection
