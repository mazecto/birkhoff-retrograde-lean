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
import Definitions.Def_BirkhoffGlobalSection

open BirkhoffGlobalSection

theorem solution (μ c : ℝ) (x : Phase) (R : ℝ)
    (hfree : ∀ r : ℝ, 0 ≤ r → r ≤ R →
      0 < secondCollisionDistanceSq (fun i : Fin 4 => r * x i)) :
    ContinuousOn (fun r : ℝ => leviCivitaHamiltonian μ c
      (fun i : Fin 4 => r * x i)) (Set.Icc 0 R) := by
  let s : ℝ → Phase := fun r i => r * x i
  let P : ℝ → ℝ := fun r =>
    wNormSq (s r) / 2 + c * zNormSq (s r) - (1 - μ) / 2 +
      2 * zNormSq (s r) * ((s r) 0 * (s r) 3 - (s r) 1 * (s r) 2) -
      μ * ((s r) 0 * (s r) 3 + (s r) 1 * (s r) 2)
  have hP : Continuous P := by
    dsimp [P, s, wNormSq, zNormSq]
    fun_prop
  have hN : Continuous (fun r => μ * zNormSq (s r)) := by
    dsimp [s, zNormSq]
    fun_prop
  have hD : Continuous (fun r =>
      Real.sqrt (secondCollisionDistanceSq (s r))) := by
    dsimp [s, secondCollisionDistanceSq]
    fun_prop
  have hDne : ∀ r ∈ Set.Icc (0 : ℝ) R,
      Real.sqrt (secondCollisionDistanceSq (s r)) ≠ 0 := by
    intro r hr
    exact ne_of_gt (Real.sqrt_pos.2 (hfree r hr.1 hr.2))
  change ContinuousOn (fun r => P r -
    μ * zNormSq (s r) / Real.sqrt (secondCollisionDistanceSq (s r)))
      (Set.Icc 0 R)
  exact hP.continuousOn.sub (hN.continuousOn.div hD.continuousOn hDne)
