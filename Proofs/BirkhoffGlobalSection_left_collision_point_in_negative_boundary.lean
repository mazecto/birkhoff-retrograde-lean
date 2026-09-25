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
import Mathlib.Tactic

open BirkhoffGlobalSection

theorem solution (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) :
    leftCollisionPoint μ ∈ closure
      (connectedComponentIn
        {t : Phase | leviCivitaHamiltonian μ c t < 0 ∧
          0 < secondCollisionDistanceSq t}
        (fun _ : Fin 4 => (0 : ℝ))) ∧
      leviCivitaHamiltonian μ c (leftCollisionPoint μ) = 0 ∧
      0 < secondCollisionDistanceSq (leftCollisionPoint μ) := by
  have hμ : 0 ≤ 1 - μ := by linarith
  have hK (t : ℝ) :
      leviCivitaHamiltonian μ c
        (fun i : Fin 4 => t * leftCollisionPoint μ i) =
        (t ^ 2 - 1) * (1 - μ) / 2 := by
    simp [leviCivitaHamiltonian, wNormSq, zNormSq,
      secondCollisionDistanceSq, leftCollisionPoint] <;> ring_nf
    rw [Real.sq_sqrt hμ]
    ring
  have hD (t : ℝ) :
      secondCollisionDistanceSq
        (fun i : Fin 4 => t * leftCollisionPoint μ i) = 1 := by
    simp [secondCollisionDistanceSq, leftCollisionPoint]
  have hnegative : ∀ t : ℝ, 0 ≤ t → t < 1 →
      leviCivitaHamiltonian μ c
        (fun i : Fin 4 => t * leftCollisionPoint μ i) < 0 := by
    intro t ht0 ht1
    rw [hK]
    have hsq : t ^ 2 < 1 := by nlinarith
    have hpos : 0 < 1 - μ := by linarith
    nlinarith
  have hfree : ∀ t : ℝ, 0 ≤ t → t ≤ 1 →
      0 < secondCollisionDistanceSq
        (fun i : Fin 4 => t * leftCollisionPoint μ i) := by
    intro t _ _
    rw [hD]
    norm_num
  have hclosure :=
    first_ray_zero_in_left_negative_closure μ c hμ0 hμ1
      (leftCollisionPoint μ) 1 (by norm_num) hnegative hfree
  have hscale : (fun i : Fin 4 => (1 : ℝ) * leftCollisionPoint μ i) =
      leftCollisionPoint μ := by funext i; simp
  refine ⟨?_, ?_, ?_⟩
  · simpa only [hscale] using hclosure
  · simpa [hscale] using hK 1
  · simpa [hscale] using hfree 1 (by norm_num) (le_refl 1)
