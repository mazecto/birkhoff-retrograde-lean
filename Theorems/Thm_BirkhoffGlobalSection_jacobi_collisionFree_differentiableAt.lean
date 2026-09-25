import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- The Jacobi Hamiltonian is differentiable away from the two primaries. -/
theorem jacobi_collisionFree_differentiableAt (μ : ℝ) (s : Phase)
    (hfree : collisionFree μ s) :
    DifferentiableAt ℝ (jacobiHamiltonian μ) s := by sorry

end BirkhoffGlobalSection
