import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- Compare the inner equilibrium with a collinear equilibrium left of both primaries. -/
theorem inner_lagrange_le_left_outer_critical_energy (μ : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) (L : Phase)
    (hL : IsInnerLagrangePoint μ L) (s : Phase)
    (hfree : collisionFree μ s)
    (hcrit : isCriticalPoint (jacobiHamiltonian μ) s)
    (haxis : s 1 = 0) (hleft : s 0 < -μ) :
    jacobiHamiltonian μ L ≤ jacobiHamiltonian μ s := by sorry

end BirkhoffGlobalSection
