import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem symmetric_half_loop_polar_winding (γ : ℝ → Plane) (τ : ℝ) (hτ : 0 < τ)
    (hcont : Continuous γ)
    (hper : ∀ t : ℝ, γ (t + 2 * τ) = γ t)
    (hrefl : ∀ t : ℝ, γ (-t) = ![γ t 0, -γ t 1])
    (hlow : ∀ t ∈ Set.Ioo 0 τ, γ t 1 < 0)
    (hstart : γ 0 1 = 0 ∧ γ 0 0 < 0)
    (hend : γ τ 1 = 0 ∧ 0 < γ τ 0) :
    HasPolarWinding γ (2 * τ) 1 := by sorry

end BirkhoffGlobalSection
