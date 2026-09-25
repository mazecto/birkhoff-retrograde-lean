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

import Mathlib.Topology.Connected.Basic
import Theorems.Thm_BirkhoffGlobalSection_left_component_closure_avoids_second_collision
import Theorems.Thm_BirkhoffGlobalSection_left_component_closure_energy_zero

open BirkhoffGlobalSection

theorem solution (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    IsClosed (leftEnergyComponent μ c) := by
  let F := regularEnergyLocus μ c
  let C := leftEnergyComponent μ c
  change IsClosed C
  have hclosure : closure C ⊆ F := by
    intro s hs
    exact ⟨left_component_closure_energy_zero μ c hμ0 hμ1 hc s hs,
      left_component_closure_avoids_second_collision μ c hμ0 hμ1 hc s hs⟩
  by_cases hx : leftCollisionPoint μ ∈ F
  · apply closure_subset_iff_isClosed.mp
    exact (isPreconnected_connectedComponentIn.closure).subset_connectedComponentIn
      (subset_closure (mem_connectedComponentIn hx)) hclosure
  · have he : C = ∅ := connectedComponentIn_eq_empty hx
    rw [he]
    exact isClosed_empty
