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
import Definitions.Def_BirkhoffGlobalSection

open BirkhoffGlobalSection

theorem solution (μ : ℝ) (s : Phase) :
    HasDerivAt
      (fun t : ℝ => jacobiHamiltonian μ (Function.update s (3 : Fin 4) t))
      (s 3 + s 0) (s 3) := by
  let C : ℝ := (s 2) ^ 2 / 2 - (s 1) * (s 2) -
      (1 - μ) / Real.sqrt ((s 0 + μ) ^ 2 + (s 1) ^ 2) -
      μ / Real.sqrt ((s 0 - 1 + μ) ^ 2 + (s 1) ^ 2)
  have hfun : (fun t : ℝ => jacobiHamiltonian μ (Function.update s (3 : Fin 4) t)) =
      (fun t : ℝ => t ^ 2 / 2 + (s 0) * t + C) := by
    funext t
    simp [C, jacobiHamiltonian, Function.update_apply]
    ring
  rw [hfun]
  have hquad := (((hasDerivAt_pow 2 (s 3)).div_const 2).add
      ((hasDerivAt_id (x := s 3)).const_mul (s 0))).add_const C
  convert hquad using 1 <;> first | rfl | (funext t; ring) | ring
