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

import Theorems.Thm_BirkhoffGlobalSection_regularized_ray_first_zero_exists
import Theorems.Thm_BirkhoffGlobalSection_first_ray_zero_on_left_energy_component

open BirkhoffGlobalSection

theorem solution (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c)
    (x : Phase) (hx : x ∈ unitThreeSphere)
    (R : ℝ) (hR : 0 < R)
    (hpositive : 0 < leviCivitaHamiltonian μ c
      (fun i : Fin 4 => R * x i))
    (hfree : ∀ r : ℝ, 0 ≤ r → r ≤ R →
      0 < secondCollisionDistanceSq (fun i : Fin 4 => r * x i)) :
    ∃ r : ℝ, 0 < r ∧
      (fun i : Fin 4 => r * x i) ∈ leftEnergyComponent μ c := by
  obtain ⟨r, hr, hrR, hzero, hnegative⟩ :=
    regularized_ray_first_zero_exists μ c hμ0 hμ1 x R hR hpositive hfree
  refine ⟨r, hr, ?_⟩
  apply first_ray_zero_on_left_energy_component μ c hμ0 hμ1 hc
    x hx r hr hzero hnegative
  intro t ht htr
  exact hfree t ht (htr.trans hrR.le)
