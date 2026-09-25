import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem inner_lagrange_le_triangular_energy (μ : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) (L : Phase)
    (hL : IsInnerLagrangePoint μ L) :
    jacobiHamiltonian μ L ≤ -(3 - μ + μ ^ 2) / 2 := by sorry

end BirkhoffGlobalSection
