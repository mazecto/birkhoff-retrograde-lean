import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- Vertical position derivative of the Jacobi Hamiltonian away from both
collisions. -/
theorem jacobi_partial_position_two (μ : ℝ) (s : Phase)
    (hfree : collisionFree μ s) :
    partialDerivative (jacobiHamiltonian μ) s 1 =
      -s 2 + (1 - μ) * (s 1) /
        (Real.sqrt ((s 0 + μ) ^ 2 + (s 1) ^ 2)) ^ 3 +
      μ * (s 1) /
        (Real.sqrt ((s 0 - 1 + μ) ^ 2 + (s 1) ^ 2)) ^ 3 := by sorry

end BirkhoffGlobalSection
