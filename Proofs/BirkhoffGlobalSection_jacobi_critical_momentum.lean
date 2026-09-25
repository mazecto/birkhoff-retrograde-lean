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
import Theorems.Thm_BirkhoffGlobalSection_jacobi_partial_momentum_one
import Theorems.Thm_BirkhoffGlobalSection_jacobi_partial_momentum_two

open BirkhoffGlobalSection

theorem solution (μ : ℝ) (s : Phase)
    (hcrit : isCriticalPoint (jacobiHamiltonian μ) s) :
    s 2 = s 1 ∧ s 3 = -s 0 := by
  have hz₂ : partialDerivative (jacobiHamiltonian μ) s 2 = 0 := by
    simp [partialDerivative, hcrit.2]
  have hz₃ : partialDerivative (jacobiHamiltonian μ) s 3 = 0 := by
    simp [partialDerivative, hcrit.2]
  have h₂ := jacobi_partial_momentum_one μ s hcrit.1
  have h₃ := jacobi_partial_momentum_two μ s hcrit.1
  constructor <;> linarith
