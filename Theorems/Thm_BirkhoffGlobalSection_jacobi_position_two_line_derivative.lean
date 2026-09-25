import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- Differentiate the Jacobi Hamiltonian on a vertical position coordinate line. -/
theorem jacobi_position_two_line_derivative (μ : ℝ) (s : Phase)
    (hfree : collisionFree μ s) :
    HasDerivAt (fun t : ℝ => jacobiHamiltonian μ (Function.update s 1 t))
      (-s 2 + (1 - μ) * (s 1) /
        (Real.sqrt ((s 0 + μ) ^ 2 + (s 1) ^ 2)) ^ 3 +
        μ * (s 1) /
        (Real.sqrt ((s 0 - 1 + μ) ^ 2 + (s 1) ^ 2)) ^ 3) (s 1) := by sorry

end BirkhoffGlobalSection
