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

import Theorems.Thm_BirkhoffGlobalSection_left_component_position_coordinates_bounded
import Theorems.Thm_BirkhoffGlobalSection_left_component_second_collision_separated
import Theorems.Thm_BirkhoffGlobalSection_regular_energy_momentum_bound_from_coordinate_bounds

open BirkhoffGlobalSection

theorem solution (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∃ Rw : ℝ, ∀ s ∈ leftEnergyComponent μ c,
      |s 2| ≤ Rw ∧ |s 3| ≤ Rw := by
  obtain ⟨Rz, hRz⟩ :=
    left_component_position_coordinates_bounded μ c hμ0 hμ1 hc
  obtain ⟨δ, hδ, hsep⟩ :=
    left_component_second_collision_separated μ c hμ0 hμ1 hc
  obtain ⟨Rw, hRw⟩ :=
    regular_energy_momentum_bound_from_coordinate_bounds μ c Rz δ hδ
  refine ⟨Rw, ?_⟩
  intro s hs
  have hreg : s ∈ regularEnergyLocus μ c :=
    connectedComponentIn_subset (regularEnergyLocus μ c) (leftCollisionPoint μ) hs
  exact hRw s hreg (hRz s hs).1 (hRz s hs).2 (hsep s hs)
