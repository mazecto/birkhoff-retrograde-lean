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

import Theorems.Thm_BirkhoffGlobalSection_left_ray_positive_energy_before_second_collision
import Theorems.Thm_BirkhoffGlobalSection_regularized_ray_first_zero_exists
import Theorems.Thm_BirkhoffGlobalSection_first_ray_zero_in_left_negative_closure
import Theorems.Thm_BirkhoffGlobalSection_left_negative_boundary_unique_ray_scale

open BirkhoffGlobalSection

theorem solution (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∀ x : {x : Phase // x ∈ unitThreeSphere},
      ∃! r : ℝ, 0 < r ∧
        (fun i : Fin 4 => r * (x : Phase) i) ∈
          {s : Phase | s ∈ closure
            (connectedComponentIn
              {t : Phase | leviCivitaHamiltonian μ c t < 0 ∧
                0 < secondCollisionDistanceSq t}
              (fun _ : Fin 4 => (0 : ℝ))) ∧
            leviCivitaHamiltonian μ c s = 0 ∧
            0 < secondCollisionDistanceSq s} := by
  intro x
  obtain ⟨R, hR, hpositive, hfree⟩ :=
    left_ray_positive_energy_before_second_collision μ c hμ0 hμ1 hc
      x.val x.property
  obtain ⟨r, hr, hrR, hzero, hnegative⟩ :=
    regularized_ray_first_zero_exists μ c hμ0 hμ1
      x.val R hR hpositive hfree
  have hsegment : ∀ t : ℝ, 0 ≤ t → t ≤ r →
      0 < secondCollisionDistanceSq
        (fun i : Fin 4 => t * (x : Phase) i) := by
    intro t ht htr
    exact hfree t ht (htr.trans hrR.le)
  have hclosure :=
    first_ray_zero_in_left_negative_closure μ c hμ0 hμ1
      x.val r hr hnegative hsegment
  refine ⟨r, ⟨hr, hclosure, hzero,
    hsegment r hr.le (le_refl r)⟩, ?_⟩
  intro t ht
  exact left_negative_boundary_unique_ray_scale μ c hμ0 hμ1 hc
    x t r ht.1 hr ht.2 ⟨hclosure, hzero,
      hsegment r hr.le (le_refl r)⟩
