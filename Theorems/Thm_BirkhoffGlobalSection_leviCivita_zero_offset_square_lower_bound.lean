import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- Completing both momentum squares leaves the position-dependent effective potential. -/
theorem leviCivita_zero_offset_square_lower_bound (μ : ℝ) (s : Phase) :
    -(zNormSq s) *
        (((leviCivitaPosition μ s) 0) ^ 2 +
          ((leviCivitaPosition μ s) 1) ^ 2) / 2 -
      (1 - μ) / 2 -
      μ * zNormSq s / Real.sqrt (secondCollisionDistanceSq s) ≤
        leviCivitaHamiltonian μ 0 s := by sorry

end BirkhoffGlobalSection
