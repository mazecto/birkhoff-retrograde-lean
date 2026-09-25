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
