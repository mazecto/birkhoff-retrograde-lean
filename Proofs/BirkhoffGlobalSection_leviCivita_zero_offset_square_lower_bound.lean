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
import Mathlib.Tactic.Linarith
import Definitions.Def_BirkhoffGlobalSection

open BirkhoffGlobalSection

theorem solution (μ : ℝ) (s : Phase) :
    -(zNormSq s) *
        (((leviCivitaPosition μ s) 0) ^ 2 +
          ((leviCivitaPosition μ s) 1) ^ 2) / 2 -
      (1 - μ) / 2 -
      μ * zNormSq s / Real.sqrt (secondCollisionDistanceSq s) ≤
        leviCivitaHamiltonian μ 0 s := by
  let Z : ℝ := zNormSq s
  let R : ℝ := -Z *
      (((leviCivitaPosition μ s) 0) ^ 2 +
        ((leviCivitaPosition μ s) 1) ^ 2) / 2 -
      (1 - μ) / 2 - μ * Z / Real.sqrt (secondCollisionDistanceSq s)
  have hidentity : leviCivitaHamiltonian μ 0 s = R +
      (s 2 - (2 * Z + μ) * s 1) ^ 2 / 2 +
      (s 3 + (2 * Z - μ) * s 0) ^ 2 / 2 := by
    dsimp [R, Z, leviCivitaHamiltonian, leviCivitaPosition,
      zNormSq, wNormSq]
    ring
  change R ≤ leviCivitaHamiltonian μ 0 s
  rw [hidentity]
  nlinarith [sq_nonneg (s 2 - (2 * Z + μ) * s 1),
    sq_nonneg (s 3 + (2 * Z - μ) * s 0)]
