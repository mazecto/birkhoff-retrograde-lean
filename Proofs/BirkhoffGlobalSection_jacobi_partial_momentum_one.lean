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

import Mathlib.Analysis.Calculus.Deriv.Pow
import Mathlib.Analysis.Calculus.Deriv.Add
import Mathlib.Analysis.Calculus.Deriv.Mul
import Mathlib.Tactic.Ring
import Theorems.Thm_BirkhoffGlobalSection_partial_derivative_eq_update_deriv

open BirkhoffGlobalSection

theorem solution (μ : ℝ) (s : Phase)
    (hdiff : DifferentiableAt ℝ (jacobiHamiltonian μ) s) :
    partialDerivative (jacobiHamiltonian μ) s 2 = s 2 - s 1 := by
  rw [partial_derivative_eq_update_deriv (jacobiHamiltonian μ) s 2 hdiff]
  let C : ℝ := (s 3) ^ 2 / 2 + (s 0) * (s 3) -
      (1 - μ) / Real.sqrt ((s 0 + μ) ^ 2 + (s 1) ^ 2) -
      μ / Real.sqrt ((s 0 - 1 + μ) ^ 2 + (s 1) ^ 2)
  have hfun : (fun t : ℝ => jacobiHamiltonian μ (Function.update s (2 : Fin 4) t)) =
      (fun t : ℝ => t ^ 2 / 2 + (-(s 1)) * t + C) := by
    funext t
    simp [C, jacobiHamiltonian, Function.update_apply]
    ring
  rw [hfun]
  have hquad := (((hasDerivAt_pow 2 (s 2)).div_const 2).add
      ((hasDerivAt_id (x := s 2)).const_mul (-(s 1)))).add_const C
  have hline : HasDerivAt (fun t : ℝ => t ^ 2 / 2 + (-(s 1)) * t + C)
      (s 2 - s 1) (s 2) := by
    convert hquad using 1 <;> first | rfl | (funext t; ring) | ring
  exact hline.deriv
