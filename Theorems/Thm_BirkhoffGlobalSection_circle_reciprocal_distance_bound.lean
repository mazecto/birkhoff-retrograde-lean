import Mathlib

namespace BirkhoffGlobalSection

/-- A reciprocal-distance bound along a circle of radius less than the primary separation. -/
theorem circle_reciprocal_distance_bound (r a : ℝ)
    (hr : 0 < r) (hr1 : r < 1)
    (ha_lo : -r ≤ a) (ha_hi : a ≤ r) :
    r - a ≤ 1 / (1 - r) -
      1 / Real.sqrt (1 + r ^ 2 - 2 * a) := by sorry

end BirkhoffGlobalSection
