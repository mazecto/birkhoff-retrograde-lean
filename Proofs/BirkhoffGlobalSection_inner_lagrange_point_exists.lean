import Theorems.Thm_BirkhoffGlobalSection_inner_collinear_force_polynomial_root
import Theorems.Thm_BirkhoffGlobalSection_inner_collinear_polynomial_root_is_equilibrium

open BirkhoffGlobalSection

theorem solution (μ : ℝ) (hμ0 : 0 < μ) (hμ1 : μ < 1) :
    ∃ L : Phase, IsInnerLagrangePoint μ L := by
  rcases inner_collinear_force_polynomial_root μ hμ0 hμ1 with
    ⟨x, hxlo, hxhi, hpoly⟩
  exact ⟨![x, 0, 0, -x],
    inner_collinear_polynomial_root_is_equilibrium μ hμ0 hμ1 x hxlo hxhi hpoly⟩
