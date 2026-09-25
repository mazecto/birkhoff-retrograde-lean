import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- The two primary distances agree at any off-axis Jacobi equilibrium. -/
theorem noncollinear_critical_equal_primary_distances (μ : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) (s : Phase)
    (hfree : collisionFree μ s)
    (hcrit : isCriticalPoint (jacobiHamiltonian μ) s)
    (hoffaxis : s 1 ≠ 0) :
    (s 0 + μ) ^ 2 + (s 1) ^ 2 =
      (s 0 - 1 + μ) ^ 2 + (s 1) ^ 2 := by sorry

end BirkhoffGlobalSection
