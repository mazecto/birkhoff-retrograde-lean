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

/-- The projection of the selected subcritical component to physical Jacobi
position stays within a bounded distance of the left primary. -/
theorem left_component_jacobi_position_radius_bounded (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∃ Rq : ℝ, ∀ s ∈ leftEnergyComponent μ c,
      ((leviCivitaPosition μ s) 0 + μ) ^ 2 +
        ((leviCivitaPosition μ s) 1) ^ 2 ≤ Rq := by sorry

end BirkhoffGlobalSection
