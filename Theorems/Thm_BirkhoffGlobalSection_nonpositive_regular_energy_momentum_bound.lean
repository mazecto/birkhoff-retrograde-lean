import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem nonpositive_regular_energy_momentum_bound
    (μ c R δ : ℝ) (hδ : 0 < δ) :
    ∃ M : ℝ, ∀ s : Phase,
      |s 0| ≤ R → |s 1| ≤ R →
      δ ≤ secondCollisionDistanceSq s →
      leviCivitaHamiltonian μ c s ≤ 0 →
      |s 2| ≤ M ∧ |s 3| ≤ M := by sorry

end BirkhoffGlobalSection
