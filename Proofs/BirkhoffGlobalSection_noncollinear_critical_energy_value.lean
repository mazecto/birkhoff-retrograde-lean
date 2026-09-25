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
import Mathlib.Tactic.Ring
import Theorems.Thm_BirkhoffGlobalSection_jacobi_critical_momentum
import Theorems.Thm_BirkhoffGlobalSection_noncollinear_critical_unit_distances

open BirkhoffGlobalSection

theorem solution (μ : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) (s : Phase)
    (hfree : collisionFree μ s)
    (hcrit : isCriticalPoint (jacobiHamiltonian μ) s)
    (hoffaxis : s 1 ≠ 0) :
    jacobiHamiltonian μ s = -(3 - μ + μ ^ 2) / 2 := by
  obtain ⟨hp₂, hp₃⟩ := jacobi_critical_momentum μ s hcrit
  obtain ⟨hd₁, hd₂⟩ :=
    noncollinear_critical_unit_distances μ hμ0 hμ1 s hfree hcrit hoffaxis
  have hcenter : s 0 = 1 / 2 - μ := by
    nlinarith [hd₁, hd₂]
  have henergy : jacobiHamiltonian μ s =
      -1 - ((s 0) ^ 2 + (s 1) ^ 2) / 2 := by
    simp [jacobiHamiltonian, hp₂, hp₃, hd₁, hd₂]
    ring
  rw [henergy, hcenter]
  rw [hcenter] at hd₁
  nlinarith [hd₁]
