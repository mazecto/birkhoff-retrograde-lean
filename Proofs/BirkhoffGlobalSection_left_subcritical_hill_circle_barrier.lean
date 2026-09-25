import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring
import Theorems.Thm_BirkhoffGlobalSection_inner_lagrange_realizes_first_critical_value
import Theorems.Thm_BirkhoffGlobalSection_inner_lagrange_circle_hamiltonian_lower_bound

open BirkhoffGlobalSection

theorem solution (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∃ Rq : ℝ, 0 < Rq ∧
      ∀ s ∈ regularEnergyLocus μ c,
        ((leviCivitaPosition μ s) 0 + μ) ^ 2 +
          ((leviCivitaPosition μ s) 1) ^ 2 ≠ Rq := by
  obtain ⟨L, hL, hfirst⟩ := inner_lagrange_realizes_first_critical_value μ hμ0 hμ1
  have hLpos : 0 < L 0 + μ := by
    have := hL.2.2.1
    linarith
  refine ⟨(L 0 + μ) ^ 2, sq_pos_of_pos hLpos, ?_⟩
  intro s hs hr
  have hrad : 4 * (zNormSq s) ^ 2 = (L 0 + μ) ^ 2 := by
    convert hr using 1
    simp [leviCivitaPosition, zNormSq]
    ring
  have hznonneg : 0 ≤ zNormSq s := by
    unfold zNormSq
    positivity
  have hzpos : 0 < zNormSq s := by
    nlinarith [sq_pos_of_pos hLpos]
  have henergy : 0 < jacobiHamiltonian μ L + c := by
    dsimp [belowFirstCriticalValue] at hc
    rw [← hfirst] at hc
    linarith
  have hcircle := inner_lagrange_circle_hamiltonian_lower_bound
    μ hμ0 hμ1 L hL s hr
  have hshift : leviCivitaHamiltonian μ c s =
      leviCivitaHamiltonian μ 0 s + c * zNormSq s := by
    simp [leviCivitaHamiltonian]
    ring
  have hpositive : 0 < leviCivitaHamiltonian μ c s := by
    rw [hshift]
    nlinarith [mul_pos hzpos henergy]
  exact (not_lt_of_ge (le_of_eq hs.1)) hpositive
