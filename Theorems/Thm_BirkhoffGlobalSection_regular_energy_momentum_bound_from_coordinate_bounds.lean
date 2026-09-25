import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem regular_energy_momentum_bound_from_coordinate_bounds
    (μ c Rz δ : ℝ) (hδ : 0 < δ) :
    ∃ Rw : ℝ, ∀ s ∈ regularEnergyLocus μ c,
      |s 0| ≤ Rz → |s 1| ≤ Rz →
      δ ≤ Real.sqrt (secondCollisionDistanceSq s) →
      |s 2| ≤ Rw ∧ |s 3| ≤ Rw := by sorry

end BirkhoffGlobalSection
