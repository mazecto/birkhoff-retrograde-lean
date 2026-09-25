import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring
import Theorems.Thm_BirkhoffGlobalSection_jacobi_critical_momentum
import Theorems.Thm_BirkhoffGlobalSection_noncollinear_critical_unit_distances

open BirkhoffGlobalSection

theorem solution (μ : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) (s : Phase)
    (hfree : collisionFree μ s)
    (hcrit : isCriticalPoint (jacobiHamiltonian μ) s)
    (hoffaxis : s 1 ≠ 0) :
    jacobiHamiltonian μ s = -(3 - μ + μ ^ 2) / 2 := by
  obtain ⟨hp₂, hp₃⟩ := jacobi_critical_momentum μ s hcrit
  obtain ⟨hd₁, hd₂⟩ :=
    noncollinear_critical_unit_distances μ hμ0 hμ1 s hfree hcrit hoffaxis
  have hcenter : s 0 = 1 / 2 - μ := by
    nlinarith [hd₁, hd₂]
  have henergy : jacobiHamiltonian μ s =
      -1 - ((s 0) ^ 2 + (s 1) ^ 2) / 2 := by
    simp [jacobiHamiltonian, hp₂, hp₃, hd₁, hd₂]
    ring
  rw [henergy, hcenter]
  rw [hcenter] at hd₁
  nlinarith [hd₁]
