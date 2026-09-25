import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

open scoped ContDiff

/-- The Levi-Civita Hamiltonian is smooth away from the unregularized second
collision. -/
theorem leviCivita_smoothAt_of_secondCollisionFree (μ c : ℝ) (s : Phase)
    (hD : 0 < secondCollisionDistanceSq s) :
    ContDiffAt ℝ ∞ (leviCivitaHamiltonian μ c) s := by sorry

end BirkhoffGlobalSection
