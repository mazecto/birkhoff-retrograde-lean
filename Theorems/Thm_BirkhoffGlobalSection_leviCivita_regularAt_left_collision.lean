import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- At the regularized left collision `z=0`, the zero-energy condition
forces nonzero `w`, so the Hamiltonian differential cannot vanish. -/
theorem leviCivita_regularAt_left_collision (μ c : ℝ)
    (hμ1 : μ < 1) (s : Phase)
    (hK : leviCivitaHamiltonian μ c s = 0)
    (hz : zNormSq s = 0) :
    fderiv ℝ (leviCivitaHamiltonian μ c) s ≠ 0 := by sorry

end BirkhoffGlobalSection
