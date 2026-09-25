import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem inner_lagrange_disk_vertical_tidal_factor (μ : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) (L : Phase) (hL : IsInnerLagrangePoint μ L)
    (x y : ℝ) (hpos : 0 < (x + μ) ^ 2 + y ^ 2)
    (hr : (x + μ) ^ 2 + y ^ 2 < (L 0 + μ) ^ 2) :
    1 < (1 - μ) / Real.sqrt ((x + μ) ^ 2 + y ^ 2) ^ 3 +
      μ / Real.sqrt ((x - 1 + μ) ^ 2 + y ^ 2) ^ 3 := by sorry

end BirkhoffGlobalSection
