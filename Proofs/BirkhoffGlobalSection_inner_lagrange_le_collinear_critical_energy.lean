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

import Mathlib.Tactic.FinCases
import Theorems.Thm_BirkhoffGlobalSection_jacobi_critical_momentum
import Theorems.Thm_BirkhoffGlobalSection_inner_collinear_critical_position_unique
import Theorems.Thm_BirkhoffGlobalSection_inner_lagrange_le_left_outer_critical_energy
import Theorems.Thm_BirkhoffGlobalSection_inner_lagrange_le_right_outer_critical_energy

open BirkhoffGlobalSection

theorem solution (μ : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) (L : Phase)
    (hL : IsInnerLagrangePoint μ L) (s : Phase)
    (hfree : collisionFree μ s)
    (hcrit : isCriticalPoint (jacobiHamiltonian μ) s)
    (haxis : s 1 = 0) :
    jacobiHamiltonian μ L ≤ jacobiHamiltonian μ s := by
  have hleftzero : s 0 + μ ≠ 0 := by
    intro hz
    have hf := hfree.1
    rw [haxis, hz] at hf
    norm_num at hf
  have hrightzero : s 0 - 1 + μ ≠ 0 := by
    intro hz
    have hf := hfree.2
    rw [haxis, hz] at hf
    norm_num at hf
  by_cases hleft : s 0 < -μ
  · exact inner_lagrange_le_left_outer_critical_energy μ hμ0 hμ1 L hL s
      hfree hcrit haxis hleft
  by_cases hright : s 0 < 1 - μ
  · have hbetween : -μ < s 0 := by
      rcases lt_or_eq_of_le (le_of_not_gt hleft) with h | h
      · exact h
      · exfalso
        exact hleftzero (by linarith)
    have hpos := inner_collinear_critical_position_unique μ hμ0 hμ1 L hL s
      hfree hcrit haxis hbetween hright
    have hLy : L 1 = 0 := hL.2.2.2.2
    have hpL := jacobi_critical_momentum μ L hL.2.1
    have hps := jacobi_critical_momentum μ s hcrit
    have hs : s = L := by
      funext i
      fin_cases i
      · exact hpos
      · simpa using haxis.trans hLy.symm
      · have h₂ : s 2 = L 2 := by rw [hps.1, hpL.1, haxis, hLy]
        simpa using h₂
      · have h₃ : s 3 = L 3 := by rw [hps.2, hpL.2, hpos]
        simpa using h₃
    rw [hs]
  · have houter : 1 - μ < s 0 := by
      rcases lt_or_eq_of_le (le_of_not_gt hright) with h | h
      · exact h
      · exfalso
        exact hrightzero (by linarith)
    exact inner_lagrange_le_right_outer_critical_energy μ hμ0 hμ1 L hL s
      hfree hcrit haxis houter
