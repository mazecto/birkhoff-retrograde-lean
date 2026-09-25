import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- The inner collinear equilibrium attains the first collision-free critical
value in the physical mass range. -/
theorem inner_lagrange_realizes_first_critical_value (μ : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) :
    ∃ L : Phase, IsInnerLagrangePoint μ L ∧
      jacobiHamiltonian μ L = firstCriticalValue μ := by sorry

end BirkhoffGlobalSection
