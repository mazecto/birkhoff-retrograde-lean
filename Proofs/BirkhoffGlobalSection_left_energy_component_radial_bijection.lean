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

import Theorems.Thm_BirkhoffGlobalSection_left_component_radial_projection_continuous
import Theorems.Thm_BirkhoffGlobalSection_left_component_unique_ray_intersection

open BirkhoffGlobalSection

theorem solution (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∃ f : LeftEnergyState μ c → {x : Phase // x ∈ unitThreeSphere},
      Continuous f ∧ Function.Bijective f ∧
        ∀ s, (f s : Phase) =
          fun i => (s : Phase) i /
            Real.sqrt (zNormSq (s : Phase) + wNormSq (s : Phase)) := by
  obtain ⟨f, hcont, hrad⟩ :=
    left_component_radial_projection_continuous μ c hμ0 hμ1 hc
  exact ⟨f, hcont,
    left_component_unique_ray_intersection μ c hμ0 hμ1 hc f hrad,
    hrad⟩
