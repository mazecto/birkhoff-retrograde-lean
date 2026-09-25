import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem noncollinear_critical_energy_value (μ : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) (s : Phase)
    (hfree : collisionFree μ s)
    (hcrit : isCriticalPoint (jacobiHamiltonian μ) s)
    (hoffaxis : s 1 ≠ 0) :
    jacobiHamiltonian μ s = -(3 - μ + μ ^ 2) / 2 := by sorry

end BirkhoffGlobalSection
