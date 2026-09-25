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

import Mathlib
import Theorems.Thm_BirkhoffGlobalSection_left_negative_closure_position_radius_lt_one

open BirkhoffGlobalSection

theorem solution (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∃ R : ℝ, ∀ s ∈ closure
      (connectedComponentIn
        {t : Phase | leviCivitaHamiltonian μ c t < 0 ∧
          0 < secondCollisionDistanceSq t}
        (fun _ : Fin 4 => (0 : ℝ))),
      |s 0| ≤ R ∧ |s 1| ≤ R := by
  obtain ⟨ρ, hρ, hbound⟩ :=
    left_negative_closure_position_radius_lt_one μ c hμ0 hμ1 hc
  refine ⟨1, ?_⟩
  intro s hs
  have hf := hbound s hs
  have heq :
      ((leviCivitaPosition μ s) 0 + μ) ^ 2 +
        ((leviCivitaPosition μ s) 1) ^ 2 =
        4 * (zNormSq s) ^ 2 := by
    dsimp [leviCivitaPosition, zNormSq]
    ring
  rw [heq] at hf
  have hz : 0 ≤ zNormSq s := by
    dsimp [zNormSq]
    positivity
  have hzlt : zNormSq s < 1 := by nlinarith
  have h0 : |s 0| ≤ (1 : ℝ) := by
    rw [abs_le]
    dsimp [zNormSq] at hzlt
    constructor <;> nlinarith [sq_nonneg (s 1)]
  have h1 : |s 1| ≤ (1 : ℝ) := by
    rw [abs_le]
    dsimp [zNormSq] at hzlt
    constructor <;> nlinarith [sq_nonneg (s 0)]
  exact ⟨h0, h1⟩
