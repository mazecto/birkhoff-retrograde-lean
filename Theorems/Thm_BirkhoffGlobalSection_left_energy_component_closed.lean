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

import Mathlib.Topology.MetricSpace.Bounded
import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- The selected subcritical component is closed in the full Levi-Civita
phase space, including across the excluded second-collision locus. -/
theorem left_energy_component_closed (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    IsClosed (leftEnergyComponent μ c) := by sorry

end BirkhoffGlobalSection
