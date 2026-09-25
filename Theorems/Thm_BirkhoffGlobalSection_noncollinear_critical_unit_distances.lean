import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- A collision-free equilibrium away from the primaries' axis lies at unit
distance from each primary, hence at an equilateral-triangle position. -/
theorem noncollinear_critical_unit_distances (μ : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) (s : Phase)
    (hfree : collisionFree μ s)
    (hcrit : isCriticalPoint (jacobiHamiltonian μ) s)
    (hoffaxis : s 1 ≠ 0) :
    (s 0 + μ) ^ 2 + (s 1) ^ 2 = 1 ∧
      (s 0 - 1 + μ) ^ 2 + (s 1) ^ 2 = 1 := by sorry

end BirkhoffGlobalSection
