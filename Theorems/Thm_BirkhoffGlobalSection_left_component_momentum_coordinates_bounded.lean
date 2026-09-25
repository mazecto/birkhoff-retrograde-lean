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

/-- At subcritical energy, the regularized momentum coordinates of the
selected component admit a uniform bound depending on the parameters. -/
theorem left_component_momentum_coordinates_bounded (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∃ Rw : ℝ, ∀ s ∈ leftEnergyComponent μ c,
      |s 2| ≤ Rw ∧ |s 3| ≤ Rw := by sorry

end BirkhoffGlobalSection
