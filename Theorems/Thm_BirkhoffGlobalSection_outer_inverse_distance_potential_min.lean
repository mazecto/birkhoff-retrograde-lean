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

/-- The unique stationary point of the strictly convex outer effective potential is its minimum. -/
theorem outer_inverse_distance_potential_min
    (a A B u v : ℝ) (hA : 0 ≤ A) (hB : 0 ≤ B)
    (hu : 0 < u) (hv : 0 < v)
    (hbal : u + a = A / u ^ 2 + B / (1 + u) ^ 2) :
    (u + a) ^ 2 / 2 + A / u + B / (1 + u) ≤
      (v + a) ^ 2 / 2 + A / v + B / (1 + v) := by sorry

end BirkhoffGlobalSection
