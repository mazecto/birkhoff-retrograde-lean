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
import Theorems.Thm_BirkhoffGlobalSection_jacobi_partial_position_two
import Theorems.Thm_BirkhoffGlobalSection_jacobi_critical_momentum

open BirkhoffGlobalSection

theorem solution (μ : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) (s : Phase)
    (hfree : collisionFree μ s)
    (hcrit : isCriticalPoint (jacobiHamiltonian μ) s)
    (hoffaxis : s 1 ≠ 0) :
    (1 - μ) / (Real.sqrt ((s 0 + μ) ^ 2 + (s 1) ^ 2)) ^ 3 +
      μ / (Real.sqrt ((s 0 - 1 + μ) ^ 2 + (s 1) ^ 2)) ^ 3 = 1 := by
  let r₁ : ℝ := Real.sqrt ((s 0 + μ) ^ 2 + (s 1) ^ 2)
  let r₂ : ℝ := Real.sqrt ((s 0 - 1 + μ) ^ 2 + (s 1) ^ 2)
  have hp : s 2 = s 1 := (jacobi_critical_momentum μ s hcrit).1
  have hz : partialDerivative (jacobiHamiltonian μ) s 1 = 0 := by
    simp [partialDerivative, hcrit.2]
  have hforce : 0 = -(s 1) + (1 - μ) * (s 1) / r₁ ^ 3 +
      μ * (s 1) / r₂ ^ 3 := by
    simpa only [hz, hp] using jacobi_partial_position_two μ s hfree
  have hfactor : (s 1) * (((1 - μ) / r₁ ^ 3 + μ / r₂ ^ 3) - 1) = 0 := by
    calc
      _ = -(s 1) + (1 - μ) * (s 1) / r₁ ^ 3 + μ * (s 1) / r₂ ^ 3 := by ring
      _ = 0 := hforce.symm
  exact sub_eq_zero.mp ((mul_eq_zero.mp hfactor).resolve_left hoffaxis)
