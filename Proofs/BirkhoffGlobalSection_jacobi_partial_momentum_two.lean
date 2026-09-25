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

import Theorems.Thm_BirkhoffGlobalSection_jacobi_momentum_two_line_derivative
import Theorems.Thm_BirkhoffGlobalSection_partial_derivative_eq_update_deriv

open BirkhoffGlobalSection

theorem solution (μ : ℝ) (s : Phase)
    (hdiff : DifferentiableAt ℝ (jacobiHamiltonian μ) s) :
    partialDerivative (jacobiHamiltonian μ) s 3 = s 3 + s 0 := by
  rw [partial_derivative_eq_update_deriv (jacobiHamiltonian μ) s 3 hdiff]
  exact (jacobi_momentum_two_line_derivative μ s).deriv
