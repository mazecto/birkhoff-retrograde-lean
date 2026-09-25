import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem left_negative_closure_radial_transversality (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∀ s ∈ closure
      (connectedComponentIn
        {u : Phase | leviCivitaHamiltonian μ c u < 0 ∧
          0 < secondCollisionDistanceSq u}
        (fun _ : Fin 4 => (0 : ℝ))),
      leviCivitaHamiltonian μ c s = 0 →
        0 < deriv (fun a : ℝ =>
          leviCivitaHamiltonian μ c (fun i : Fin 4 => a * s i)) 1 := by sorry

end BirkhoffGlobalSection
