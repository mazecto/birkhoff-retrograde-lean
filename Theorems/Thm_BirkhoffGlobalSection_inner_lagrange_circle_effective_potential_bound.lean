import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- The position potential on the circle through the inner equilibrium is bounded by its value there. -/
theorem inner_lagrange_circle_effective_potential_bound (μ : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) (L : Phase)
    (hL : IsInnerLagrangePoint μ L) (s : Phase)
    (hr : ((leviCivitaPosition μ s) 0 + μ) ^ 2 +
      ((leviCivitaPosition μ s) 1) ^ 2 = (L 0 + μ) ^ 2) :
    zNormSq s * jacobiHamiltonian μ L ≤
      -(zNormSq s) *
        (((leviCivitaPosition μ s) 0) ^ 2 +
          ((leviCivitaPosition μ s) 1) ^ 2) / 2 -
      (1 - μ) / 2 -
      μ * zNormSq s / Real.sqrt (secondCollisionDistanceSq s) := by sorry

end BirkhoffGlobalSection
