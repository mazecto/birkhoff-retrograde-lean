import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- A root of the collinear force equation gives a collision-free inner equilibrium. -/
theorem inner_collinear_polynomial_root_is_equilibrium (μ : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) (x : ℝ)
    (hxlo : -μ < x) (hxhi : x < 1 - μ)
    (hpoly : x * (x + μ) ^ 2 * (1 - μ - x) ^ 2 -
      (1 - μ) * (1 - μ - x) ^ 2 + μ * (x + μ) ^ 2 = 0) :
    IsInnerLagrangePoint μ (![x, 0, 0, -x] : Phase) := by sorry

end BirkhoffGlobalSection
