import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem inner_lagrange_ball_radial_convexity (μ : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) (L : Phase) (hL : IsInnerLagrangePoint μ L)
    (ρ κ : ℝ) (hρ0 : 0 < ρ) (hρd : ρ ≤ L 0 + μ)
    (hκ0 : -1 ≤ κ) (hκ1 : κ ≤ 1) :
    1 ≤ 1 + 2 * (1 - μ) / ρ ^ 3 +
      μ * (3 * (ρ - κ) ^ 2 - (ρ ^ 2 - 2 * ρ * κ + 1)) /
        Real.sqrt (ρ ^ 2 - 2 * ρ * κ + 1) ^ 5 := by sorry

end BirkhoffGlobalSection
