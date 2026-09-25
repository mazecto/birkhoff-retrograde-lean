import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- Vertical force balance at an off-axis Jacobi equilibrium. -/
theorem noncollinear_critical_vertical_balance (μ : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) (s : Phase)
    (hfree : collisionFree μ s)
    (hcrit : isCriticalPoint (jacobiHamiltonian μ) s)
    (hoffaxis : s 1 ≠ 0) :
    (1 - μ) / (Real.sqrt ((s 0 + μ) ^ 2 + (s 1) ^ 2)) ^ 3 +
      μ / (Real.sqrt ((s 0 - 1 + μ) ^ 2 + (s 1) ^ 2)) ^ 3 = 1 := by sorry

end BirkhoffGlobalSection
