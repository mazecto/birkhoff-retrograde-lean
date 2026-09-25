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

theorem solution (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∀ s ∈ leftEnergyComponent μ c,
      0 < zNormSq s + wNormSq s := by
  intro s hs
  have hnonneg : 0 ≤ zNormSq s + wNormSq s := by
    dsimp [zNormSq, wNormSq]
    positivity
  by_contra h
  have hnorm : zNormSq s + wNormSq s = 0 :=
    le_antisymm (le_of_not_gt h) hnonneg
  have h0 : s 0 = 0 := by
    dsimp [zNormSq, wNormSq] at hnorm
    nlinarith [sq_nonneg (s 1), sq_nonneg (s 2), sq_nonneg (s 3)]
  have h1 : s 1 = 0 := by
    dsimp [zNormSq, wNormSq] at hnorm
    nlinarith [sq_nonneg (s 0), sq_nonneg (s 2), sq_nonneg (s 3)]
  have h2 : s 2 = 0 := by
    dsimp [zNormSq, wNormSq] at hnorm
    nlinarith [sq_nonneg (s 0), sq_nonneg (s 1), sq_nonneg (s 3)]
  have h3 : s 3 = 0 := by
    dsimp [zNormSq, wNormSq] at hnorm
    nlinarith [sq_nonneg (s 0), sq_nonneg (s 1), sq_nonneg (s 2)]
  have hreg : s ∈ regularEnergyLocus μ c :=
    connectedComponentIn_subset (regularEnergyLocus μ c)
      (leftCollisionPoint μ) hs
  have henergy : leviCivitaHamiltonian μ c s = 0 := hreg.1
  simp only [leviCivitaHamiltonian, zNormSq, wNormSq,
    secondCollisionDistanceSq, h0, h1, h2, h3] at henergy
  norm_num at henergy
  linarith
