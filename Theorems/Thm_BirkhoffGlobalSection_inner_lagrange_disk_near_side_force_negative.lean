import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem inner_lagrange_disk_near_side_force_negative (μ : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) (L : Phase) (hL : IsInnerLagrangePoint μ L)
    (x y : ℝ) (hx : -μ < x)
    (hr : (x + μ) ^ 2 + y ^ 2 < (L 0 + μ) ^ 2) :
    x - (1 - μ) * (x + μ) / Real.sqrt ((x + μ) ^ 2 + y ^ 2) ^ 3 -
      μ * (x - 1 + μ) / Real.sqrt ((x - 1 + μ) ^ 2 + y ^ 2) ^ 3 < 0 := by sorry

end BirkhoffGlobalSection
