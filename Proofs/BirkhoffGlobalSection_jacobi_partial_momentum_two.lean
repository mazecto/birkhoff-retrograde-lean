import Theorems.Thm_BirkhoffGlobalSection_jacobi_momentum_two_line_derivative
import Theorems.Thm_BirkhoffGlobalSection_partial_derivative_eq_update_deriv

open BirkhoffGlobalSection

theorem solution (μ : ℝ) (s : Phase)
    (hdiff : DifferentiableAt ℝ (jacobiHamiltonian μ) s) :
    partialDerivative (jacobiHamiltonian μ) s 3 = s 3 + s 0 := by
  rw [partial_derivative_eq_update_deriv (jacobiHamiltonian μ) s 3 hdiff]
  exact (jacobi_momentum_two_line_derivative μ s).deriv
