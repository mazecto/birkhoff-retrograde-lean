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

theorem solution (M A B K u v : ℝ) (hM : 0 ≤ M)
    (hA : |A| ≤ M) (hB : |B| ≤ M) (hK : |K| ≤ M)
    (henergy : (u ^ 2 + v ^ 2) / 2 + A * u + B * v + K = 0) :
    |u| ≤ 4 * M + 4 ∧ |v| ≤ 4 * M + 4 := by
  have hAsq : A ^ 2 ≤ M ^ 2 := by
    have h := (sq_le_sq₀ (abs_nonneg A) hM).mpr hA
    simpa only [sq_abs] using h
  have hBsq : B ^ 2 ≤ M ^ 2 := by
    have h := (sq_le_sq₀ (abs_nonneg B) hM).mpr hB
    simpa only [sq_abs] using h
  have hsum : (u + A) ^ 2 + (v + B) ^ 2 ≤ 2 * M ^ 2 + 2 * M := by
    nlinarith only [henergy, hAsq, hBsq, (abs_le.mp hK).1]
  have huSq : (u + A) ^ 2 ≤ (2 * M + 2) ^ 2 := by
    nlinarith only [hsum, sq_nonneg (v + B), sq_nonneg M, hM]
  have hvSq : (v + B) ^ 2 ≤ (2 * M + 2) ^ 2 := by
    nlinarith only [hsum, sq_nonneg (u + A), sq_nonneg M, hM]
  have hshiftu : |u + A| ≤ 2 * M + 2 :=
    abs_le_of_sq_le_sq huSq (by linarith)
  have hshiftv : |v + B| ≤ 2 * M + 2 :=
    abs_le_of_sq_le_sq hvSq (by linarith)
  constructor
  · calc
      |u| = |(u + A) + (-A)| := by ring
      _ ≤ |u + A| + |-A| := abs_add_le _ _
      _ = |u + A| + |A| := by rw [abs_neg]
      _ ≤ 4 * M + 4 := by linarith
  · calc
      |v| = |(v + B) + (-B)| := by ring
      _ ≤ |v + B| + |-B| := abs_add_le _ _
      _ = |v + B| + |B| := by rw [abs_neg]
      _ ≤ 4 * M + 4 := by linarith
