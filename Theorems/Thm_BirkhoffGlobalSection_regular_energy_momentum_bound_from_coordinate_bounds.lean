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

import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem regular_energy_momentum_bound_from_coordinate_bounds
    (μ c Rz δ : ℝ) (hδ : 0 < δ) :
    ∃ Rw : ℝ, ∀ s ∈ regularEnergyLocus μ c,
      |s 0| ≤ Rz → |s 1| ≤ Rz →
      δ ≤ Real.sqrt (secondCollisionDistanceSq s) →
      |s 2| ≤ Rw ∧ |s 3| ≤ Rw := by sorry

end BirkhoffGlobalSection
