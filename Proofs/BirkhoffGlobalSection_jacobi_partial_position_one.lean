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

import Theorems.Thm_BirkhoffGlobalSection_partial_derivative_eq_update_deriv
import Theorems.Thm_BirkhoffGlobalSection_jacobi_collisionFree_differentiableAt
import Theorems.Thm_BirkhoffGlobalSection_jacobi_position_one_line_derivative

open BirkhoffGlobalSection

theorem solution (μ : ℝ) (s : Phase)
    (hfree : collisionFree μ s) :
    partialDerivative (jacobiHamiltonian μ) s 0 =
      s 3 + (1 - μ) * (s 0 + μ) /
        (Real.sqrt ((s 0 + μ) ^ 2 + (s 1) ^ 2)) ^ 3 +
      μ * (s 0 - 1 + μ) /
        (Real.sqrt ((s 0 - 1 + μ) ^ 2 + (s 1) ^ 2)) ^ 3 := by
  rw [partial_derivative_eq_update_deriv (jacobiHamiltonian μ) s 0
    (jacobi_collisionFree_differentiableAt μ s hfree)]
  exact (jacobi_position_one_line_derivative μ s hfree).deriv
