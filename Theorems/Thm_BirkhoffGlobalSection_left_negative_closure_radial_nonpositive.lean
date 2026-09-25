import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem left_negative_closure_radial_nonpositive (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∀ s ∈ closure
      (connectedComponentIn
        {u : Phase | leviCivitaHamiltonian μ c u < 0 ∧
          0 < secondCollisionDistanceSq u}
        (fun _ : Fin 4 => (0 : ℝ))),
      ∀ a : ℝ, 0 ≤ a → a < 1 →
        leviCivitaHamiltonian μ c
          (fun i : Fin 4 => a * s i) ≤ 0 := by sorry

end BirkhoffGlobalSection
