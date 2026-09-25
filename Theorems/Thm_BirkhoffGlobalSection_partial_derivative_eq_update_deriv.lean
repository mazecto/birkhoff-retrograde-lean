import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- A Fréchet partial derivative equals the ordinary derivative along the
corresponding coordinate line in four-dimensional phase space. -/
theorem partial_derivative_eq_update_deriv
    (F : Phase → ℝ) (s : Phase) (i : Fin 4)
    (hdiff : DifferentiableAt ℝ F s) :
    partialDerivative F s i =
      deriv (fun t : ℝ => F (Function.update s i t)) (s i) := by sorry

end BirkhoffGlobalSection
