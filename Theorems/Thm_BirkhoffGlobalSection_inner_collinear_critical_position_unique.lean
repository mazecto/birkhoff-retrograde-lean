import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- An equilibrium on the open interval between the primaries is the unique inner equilibrium. -/
theorem inner_collinear_critical_position_unique (μ : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) (L : Phase)
    (hL : IsInnerLagrangePoint μ L) (s : Phase)
    (hfree : collisionFree μ s)
    (hcrit : isCriticalPoint (jacobiHamiltonian μ) s)
    (haxis : s 1 = 0) (hleft : -μ < s 0) (hright : s 0 < 1 - μ) :
    s 0 = L 0 := by sorry

end BirkhoffGlobalSection
