import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

/-- Algebraic evenness of the totalized Levi-Civita formula, together with the
free component-preserving antipodal deck action in the physical subcritical
regime of Joung--van Koert, Proposition 2.4. -/
theorem antipodal_symmetry (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) (hc : belowFirstCriticalValue μ c) :
    (∀ s : Phase,
      leviCivitaHamiltonian μ c (-s) = leviCivitaHamiltonian μ c s) ∧
    IsAntipodallyInvariantComponent μ c ∧
    IsAntipodallyFreeComponent μ c := by sorry

end BirkhoffGlobalSection
