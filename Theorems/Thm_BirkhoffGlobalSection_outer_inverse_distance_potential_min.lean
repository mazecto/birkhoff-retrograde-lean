import Mathlib

namespace BirkhoffGlobalSection

/-- The unique stationary point of the strictly convex outer effective potential is its minimum. -/
theorem outer_inverse_distance_potential_min
    (a A B u v : ℝ) (hA : 0 ≤ A) (hB : 0 ≤ B)
    (hu : 0 < u) (hv : 0 < v)
    (hbal : u + a = A / u ^ 2 + B / (1 + u) ^ 2) :
    (u + a) ^ 2 / 2 + A / u + B / (1 + u) ≤
      (v + a) ^ 2 / 2 + A / v + B / (1 + v) := by sorry

end BirkhoffGlobalSection
