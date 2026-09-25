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

import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring
import Mathlib.Analysis.Real.Sqrt
import Theorems.Thm_BirkhoffGlobalSection_left_component_jacobi_position_radius_bounded

open BirkhoffGlobalSection

theorem solution (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∃ Rz : ℝ, ∀ s ∈ leftEnergyComponent μ c,
      |s 0| ≤ Rz ∧ |s 1| ≤ Rz := by
  obtain ⟨Rq, hq⟩ :=
    left_component_jacobi_position_radius_bounded μ c hμ0 hμ1 hc
  refine ⟨Real.sqrt (max 1 Rq), ?_⟩
  intro s hs
  have hid : ((leviCivitaPosition μ s) 0 + μ) ^ 2 +
      ((leviCivitaPosition μ s) 1) ^ 2 =
        4 * (zNormSq s) ^ 2 := by
    simp [leviCivitaPosition, zNormSq]
    ring
  have hrad : 4 * (zNormSq s) ^ 2 ≤ Rq := by
    simpa only [hid] using hq s hs
  have hznonneg : 0 ≤ zNormSq s := by
    unfold zNormSq
    positivity
  have hzbound : zNormSq s ≤ max 1 Rq := by
    by_cases hsmall : zNormSq s ≤ 1
    · exact hsmall.trans (le_max_left 1 Rq)
    · have hone : 1 ≤ zNormSq s := le_of_not_ge hsmall
      have hsq : zNormSq s ≤ (zNormSq s) ^ 2 := by
        nlinarith [mul_nonneg (sub_nonneg.mpr hone) hznonneg]
      nlinarith [le_max_right (1 : ℝ) Rq]
  have hx : (s 0) ^ 2 ≤ max 1 Rq := by
    dsimp [zNormSq] at hzbound
    nlinarith [sq_nonneg (s 1)]
  have hy : (s 1) ^ 2 ≤ max 1 Rq := by
    dsimp [zNormSq] at hzbound
    nlinarith [sq_nonneg (s 0)]
  exact ⟨Real.abs_le_sqrt hx, Real.abs_le_sqrt hy⟩
