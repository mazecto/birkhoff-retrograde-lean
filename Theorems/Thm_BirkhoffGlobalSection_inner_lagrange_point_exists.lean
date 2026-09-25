import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- For physical masses the unique equilibrium on the open segment between
the two primaries gives an inner Lagrange point. -/
theorem inner_lagrange_point_exists (μ : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) :
    ∃ L : Phase, IsInnerLagrangePoint μ L := by sorry

end BirkhoffGlobalSection
