import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- First momentum partial derivative of the Jacobi Hamiltonian, at a point
where the totalized potential is differentiable. -/
theorem jacobi_partial_momentum_one (μ : ℝ) (s : Phase)
    (hdiff : DifferentiableAt ℝ (jacobiHamiltonian μ) s) :
    partialDerivative (jacobiHamiltonian μ) s 2 = s 2 - s 1 := by sorry

end BirkhoffGlobalSection
