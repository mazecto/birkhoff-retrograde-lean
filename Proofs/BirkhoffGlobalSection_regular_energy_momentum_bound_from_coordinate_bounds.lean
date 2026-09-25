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

import Mathlib.Tactic.Ring
import Mathlib.Tactic.LinearCombination
import Theorems.Thm_BirkhoffGlobalSection_regular_energy_coefficients_bounded_on_box
import Theorems.Thm_BirkhoffGlobalSection_quadratic_energy_coordinate_bound

open BirkhoffGlobalSection

theorem solution (μ c Rz δ : ℝ) (hδ : 0 < δ) :
    ∃ Rw : ℝ, ∀ s ∈ regularEnergyLocus μ c,
      |s 0| ≤ Rz → |s 1| ≤ Rz →
      δ ≤ Real.sqrt (secondCollisionDistanceSq s) →
      |s 2| ≤ Rw ∧ |s 3| ≤ Rw := by
  obtain ⟨M, hM, hcoeff⟩ :=
    regular_energy_coefficients_bounded_on_box μ c Rz δ hδ
  refine ⟨4 * M + 4, ?_⟩
  intro s hs hx hy hd
  obtain ⟨hA, hB, hK⟩ := hcoeff s hs hx hy hd
  have hzero : leviCivitaHamiltonian μ c s = 0 := hs.1
  have heq : ((s 2) ^ 2 + (s 3) ^ 2) / 2 +
      (-(2 * zNormSq s + μ) * s 1) * s 2 +
      ((2 * zNormSq s - μ) * s 0) * s 3 +
      (c * zNormSq s - (1 - μ) / 2 -
        μ * zNormSq s / Real.sqrt (secondCollisionDistanceSq s)) = 0 := by
    unfold leviCivitaHamiltonian wNormSq at hzero
    simp only [div_eq_mul_inv] at hzero ⊢
    linear_combination hzero
  exact quadratic_energy_coordinate_bound M
    (-(2 * zNormSq s + μ) * s 1)
    ((2 * zNormSq s - μ) * s 0)
    (c * zNormSq s - (1 - μ) / 2 -
      μ * zNormSq s / Real.sqrt (secondCollisionDistanceSq s))
    (s 2) (s 3) hM hA hB hK heq
