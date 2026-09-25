import Mathlib

namespace BirkhoffGlobalSection

/-- Reflection across a primary lowers its contribution to the effective potential. -/
theorem inner_outer_reflection_potential (a u : ℝ)
    (ha : 0 ≤ a) (hu : 0 < u) (hu1 : u < 1) :
    (a + u) ^ 2 / 2 + a / (1 + u) ≤
      (a - u) ^ 2 / 2 + a / (1 - u) := by sorry

end BirkhoffGlobalSection
