import Mathlib.Tactic.FunProp
import Definitions.Def_BirkhoffGlobalSection

open BirkhoffGlobalSection

theorem solution (μ : ℝ) (s : Phase)
    (hfree : collisionFree μ s) :
    DifferentiableAt ℝ (jacobiHamiltonian μ) s := by
  rcases hfree with ⟨h₁, h₂⟩
  have h₁sqrt : Real.sqrt ((s 0 + μ) ^ 2 + (s 1) ^ 2) ≠ 0 :=
    (Real.sqrt_pos.2 h₁).ne'
  have h₂sqrt : Real.sqrt ((s 0 - 1 + μ) ^ 2 + (s 1) ^ 2) ≠ 0 :=
    (Real.sqrt_pos.2 h₂).ne'
  have h₁ne : (s 0 + μ) ^ 2 + (s 1) ^ 2 ≠ 0 := h₁.ne'
  have h₂ne : (s 0 - 1 + μ) ^ 2 + (s 1) ^ 2 ≠ 0 := h₂.ne'
  unfold jacobiHamiltonian
  fun_prop (disch := assumption)
