import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- Differentiate the Jacobi Hamiltonian on the horizontal position coordinate line. -/
theorem jacobi_position_one_line_derivative (μ : ℝ) (s : Phase)
    (hfree : collisionFree μ s) :
    HasDerivAt (fun t : ℝ => jacobiHamiltonian μ (Function.update s 0 t))
      (s 3 + (1 - μ) * (s 0 + μ) /
        (Real.sqrt ((s 0 + μ) ^ 2 + (s 1) ^ 2)) ^ 3 +
        μ * (s 0 - 1 + μ) /
        (Real.sqrt ((s 0 - 1 + μ) ^ 2 + (s 1) ^ 2)) ^ 3) (s 0) := by sorry

end BirkhoffGlobalSection
