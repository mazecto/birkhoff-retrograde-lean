import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- Second momentum partial derivative of the Jacobi Hamiltonian, at a point
where the totalized potential is differentiable. -/
theorem jacobi_partial_momentum_two (μ : ℝ) (s : Phase)
    (hdiff : DifferentiableAt ℝ (jacobiHamiltonian μ) s) :
    partialDerivative (jacobiHamiltonian μ) s 3 = s 3 + s 0 := by sorry

end BirkhoffGlobalSection
