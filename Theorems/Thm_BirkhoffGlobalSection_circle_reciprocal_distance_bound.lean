/-
Copyright 2026 Dhia Eddine Ramdani

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-/

import Mathlib

namespace BirkhoffGlobalSection

/-- A reciprocal-distance bound along a circle of radius less than the primary separation. -/
theorem circle_reciprocal_distance_bound (r a : ℝ)
    (hr : 0 < r) (hr1 : r < 1)
    (ha_lo : -r ≤ a) (ha_hi : a ≤ r) :
    r - a ≤ 1 / (1 - r) -
      1 / Real.sqrt (1 + r ^ 2 - 2 * a) := by sorry

end BirkhoffGlobalSection
