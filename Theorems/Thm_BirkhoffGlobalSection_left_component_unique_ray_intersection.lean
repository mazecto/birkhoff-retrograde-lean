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

/-- Every direction meets the selected star-shaped component in exactly one
positive radial point, so any map with the radial formula is bijective. -/
theorem left_component_unique_ray_intersection (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c)
    (f : LeftEnergyState μ c → {x : Phase // x ∈ unitThreeSphere})
    (hrad : ∀ s, (f s : Phase) =
      fun i => (s : Phase) i /
        Real.sqrt (zNormSq (s : Phase) + wNormSq (s : Phase))) :
    Function.Bijective f := by sorry

end BirkhoffGlobalSection
