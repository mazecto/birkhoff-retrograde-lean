import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- The inner collinear equilibrium has no greater Jacobi Hamiltonian value
than any collision-free equilibrium, including the outer and triangular ones. -/
theorem inner_lagrange_minimizes_critical_energy (μ : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) (L : Phase)
    (hL : IsInnerLagrangePoint μ L) :
    ∀ e ∈ criticalValueSet μ, jacobiHamiltonian μ L ≤ e := by sorry

end BirkhoffGlobalSection
