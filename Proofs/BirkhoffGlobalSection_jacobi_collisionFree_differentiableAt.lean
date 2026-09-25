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

import Mathlib.Tactic.FunProp
import Definitions.Def_BirkhoffGlobalSection

open BirkhoffGlobalSection

theorem solution (μ : ℝ) (s : Phase)
    (hfree : collisionFree μ s) :
    DifferentiableAt ℝ (jacobiHamiltonian μ) s := by
  rcases hfree with ⟨h₁, h₂⟩
  have h₁sqrt : Real.sqrt ((s 0 + μ) ^ 2 + (s 1) ^ 2) ≠ 0 :=
    (Real.sqrt_pos.2 h₁).ne'
  have h₂sqrt : Real.sqrt ((s 0 - 1 + μ) ^ 2 + (s 1) ^ 2) ≠ 0 :=
    (Real.sqrt_pos.2 h₂).ne'
  have h₁ne : (s 0 + μ) ^ 2 + (s 1) ^ 2 ≠ 0 := h₁.ne'
  have h₂ne : (s 0 - 1 + μ) ^ 2 + (s 1) ^ 2 ≠ 0 := h₂.ne'
  unfold jacobiHamiltonian
  fun_prop (disch := assumption)
