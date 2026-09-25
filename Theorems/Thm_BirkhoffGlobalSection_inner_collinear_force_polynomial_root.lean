import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- The cleared-denominator collinear force equation has a root between the primaries. -/
theorem inner_collinear_force_polynomial_root (μ : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) :
    ∃ x : ℝ, -μ < x ∧ x < 1 - μ ∧
      x * (x + μ) ^ 2 * (1 - μ - x) ^ 2 -
        (1 - μ) * (1 - μ - x) ^ 2 + μ * (x + μ) ^ 2 = 0 := by sorry

end BirkhoffGlobalSection
