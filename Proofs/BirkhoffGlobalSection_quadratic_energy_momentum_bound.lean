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

theorem solution (K A B C p q : ℝ)
    (hK : 0 ≤ K) (hA : |A| ≤ K) (hB : |B| ≤ K) (hC : -K ≤ C)
    (henergy : (p ^ 2 + q ^ 2) / 2 + A * p + B * q + C ≤ 0) :
    |p| ≤ 4 * (K + 1) ∧ |q| ≤ 4 * (K + 1) := by
  have hA2 : A ^ 2 ≤ K ^ 2 := by
    have h := (sq_le_sq₀ (abs_nonneg A) hK).mpr hA
    simpa only [sq_abs] using h
  have hB2 : B ^ 2 ≤ K ^ 2 := by
    have h := (sq_le_sq₀ (abs_nonneg B) hK).mpr hB
    simpa only [sq_abs] using h
  have hsum : (p + A) ^ 2 + (q + B) ^ 2 ≤ 2 * K ^ 2 + 2 * K := by
    nlinarith only [henergy, hA2, hB2, hC]
  have hpSq : (p + A) ^ 2 ≤ (2 * K + 2) ^ 2 := by
    nlinarith only [hsum, sq_nonneg (q + B), sq_nonneg K, hK]
  have hqSq : (q + B) ^ 2 ≤ (2 * K + 2) ^ 2 := by
    nlinarith only [hsum, sq_nonneg (p + A), sq_nonneg K, hK]
  have hpShift : |p + A| ≤ 2 * K + 2 :=
    abs_le_of_sq_le_sq hpSq (by linarith)
  have hqShift : |q + B| ≤ 2 * K + 2 :=
    abs_le_of_sq_le_sq hqSq (by linarith)
  constructor
  · calc
      |p| = |(p + A) + (-A)| := by ring
      _ ≤ |p + A| + |-A| := abs_add_le _ _
      _ = |p + A| + |A| := by rw [abs_neg]
      _ ≤ 4 * (K + 1) := by linarith
  · calc
      |q| = |(q + B) + (-B)| := by ring
      _ ≤ |q + B| + |-B| := abs_add_le _ _
      _ = |q + B| + |B| := by rw [abs_neg]
      _ ≤ 4 * (K + 1) := by linarith
