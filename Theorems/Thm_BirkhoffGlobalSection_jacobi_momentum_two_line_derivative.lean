import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- Along the second momentum coordinate line, the potential is constant and
the Jacobi Hamiltonian is quadratic in that coordinate. -/
theorem jacobi_momentum_two_line_derivative (μ : ℝ) (s : Phase) :
    HasDerivAt
      (fun t : ℝ => jacobiHamiltonian μ (Function.update s (3 : Fin 4) t))
      (s 3 + s 0) (s 3) := by sorry

end BirkhoffGlobalSection
