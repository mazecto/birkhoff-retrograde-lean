import Mathlib
import Theorems.Thm_BirkhoffGlobalSection_left_negative_closure_position_radius_lt_one

open BirkhoffGlobalSection

theorem solution (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∀ s ∈ closure
      (connectedComponentIn
        {t : Phase | leviCivitaHamiltonian μ c t < 0 ∧
          0 < secondCollisionDistanceSq t}
        (fun _ : Fin 4 => (0 : ℝ))),
      0 < secondCollisionDistanceSq s := by
  obtain ⟨ρ, hρ, hbound⟩ :=
    left_negative_closure_position_radius_lt_one μ c hμ0 hμ1 hc
  intro s hs
  have hfs := hbound s hs
  let u : ℝ := 2 * (s 0 ^ 2 - s 1 ^ 2)
  let v : ℝ := 4 * s 0 * s 1
  have hD : secondCollisionDistanceSq s = (u - 1) ^ 2 + v ^ 2 := by
    rfl
  have hnonneg : 0 ≤ secondCollisionDistanceSq s := by
    rw [hD]
    positivity
  by_contra hn
  have hDzero : secondCollisionDistanceSq s = 0 :=
    le_antisymm (le_of_not_gt hn) hnonneg
  rw [hD] at hDzero
  have hu : u = 1 := by nlinarith [sq_nonneg v]
  have hv : v = 0 := by nlinarith [sq_nonneg (u - 1)]
  have hfs_eq :
      ((leviCivitaPosition μ s) 0 + μ) ^ 2 +
        ((leviCivitaPosition μ s) 1) ^ 2 = u ^ 2 + v ^ 2 := by
    dsimp [leviCivitaPosition, u, v]
    ring
  rw [hfs_eq, hu, hv] at hfs
  norm_num at hfs
  linarith
