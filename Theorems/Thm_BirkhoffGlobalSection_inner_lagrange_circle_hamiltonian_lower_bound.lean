import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- At the position circle through the inner collinear equilibrium, its
effective potential is maximal. Completing the momentum squares gives this
lower bound on the zero-offset Levi-Civita Hamiltonian. -/
theorem inner_lagrange_circle_hamiltonian_lower_bound (μ : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) (L : Phase)
    (hL : IsInnerLagrangePoint μ L) (s : Phase)
    (hr : ((leviCivitaPosition μ s) 0 + μ) ^ 2 +
      ((leviCivitaPosition μ s) 1) ^ 2 = (L 0 + μ) ^ 2) :
    zNormSq s * jacobiHamiltonian μ L ≤ leviCivitaHamiltonian μ 0 s := by sorry

end BirkhoffGlobalSection
