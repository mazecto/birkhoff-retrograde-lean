import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- The momentum derivatives of the Jacobi Hamiltonian vanish only at the
rotating-frame momentum determined by the position. -/
theorem jacobi_critical_momentum (μ : ℝ) (s : Phase)
    (hcrit : isCriticalPoint (jacobiHamiltonian μ) s) :
    s 2 = s 1 ∧ s 3 = -s 0 := by sorry

end BirkhoffGlobalSection
