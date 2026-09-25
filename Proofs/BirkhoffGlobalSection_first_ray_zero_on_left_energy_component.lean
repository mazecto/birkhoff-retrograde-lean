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

import Theorems.Thm_BirkhoffGlobalSection_first_ray_zero_in_left_negative_closure
import Theorems.Thm_BirkhoffGlobalSection_left_negative_boundary_zero_in_energy_component

open BirkhoffGlobalSection

theorem solution (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c)
    (x : Phase) (hx : x ∈ unitThreeSphere)
    (r : ℝ) (hr : 0 < r)
    (hzero : leviCivitaHamiltonian μ c
      (fun i : Fin 4 => r * x i) = 0)
    (hnegative : ∀ t : ℝ, 0 ≤ t → t < r →
      leviCivitaHamiltonian μ c (fun i : Fin 4 => t * x i) < 0)
    (hfree : ∀ t : ℝ, 0 ≤ t → t ≤ r →
      0 < secondCollisionDistanceSq (fun i : Fin 4 => t * x i)) :
    (fun i : Fin 4 => r * x i) ∈ leftEnergyComponent μ c := by
  have hclosure :=
    first_ray_zero_in_left_negative_closure μ c hμ0 hμ1 x r hr hnegative hfree
  exact left_negative_boundary_zero_in_energy_component μ c hμ0 hμ1 hc
    (fun i : Fin 4 => r * x i) hclosure hzero
    (hfree r (le_of_lt hr) (le_refl r))
