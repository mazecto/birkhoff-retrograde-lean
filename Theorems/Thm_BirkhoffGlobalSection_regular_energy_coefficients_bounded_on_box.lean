import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem regular_energy_coefficients_bounded_on_box
    (μ c Rz δ : ℝ) (hδ : 0 < δ) :
    ∃ M : ℝ, 0 ≤ M ∧ ∀ s ∈ regularEnergyLocus μ c,
      |s 0| ≤ Rz → |s 1| ≤ Rz →
      δ ≤ Real.sqrt (secondCollisionDistanceSq s) →
      |-(2 * zNormSq s + μ) * s 1| ≤ M ∧
      |(2 * zNormSq s - μ) * s 0| ≤ M ∧
      |c * zNormSq s - (1 - μ) / 2 -
        μ * zNormSq s / Real.sqrt (secondCollisionDistanceSq s)| ≤ M := by sorry

end BirkhoffGlobalSection
