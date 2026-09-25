import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- Compare the inner equilibrium with a collinear equilibrium right of both primaries. -/
theorem inner_lagrange_le_right_outer_critical_energy (μ : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) (L : Phase)
    (hL : IsInnerLagrangePoint μ L) (s : Phase)
    (hfree : collisionFree μ s)
    (hcrit : isCriticalPoint (jacobiHamiltonian μ) s)
    (haxis : s 1 = 0) (hright : 1 - μ < s 0) :
    jacobiHamiltonian μ L ≤ jacobiHamiltonian μ s := by sorry

end BirkhoffGlobalSection
