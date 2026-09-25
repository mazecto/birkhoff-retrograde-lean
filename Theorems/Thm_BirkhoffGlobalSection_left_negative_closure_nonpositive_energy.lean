import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem left_negative_closure_nonpositive_energy (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∀ s ∈ closure
      (connectedComponentIn
        {t : Phase | leviCivitaHamiltonian μ c t < 0 ∧
          0 < secondCollisionDistanceSq t}
        (fun _ : Fin 4 => (0 : ℝ))),
      leviCivitaHamiltonian μ c s ≤ 0 := by sorry

end BirkhoffGlobalSection
