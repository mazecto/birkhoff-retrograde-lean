import Mathlib

/-!
Hatcher, *Algebraic Topology*, Section 1.1, "The Fundamental Group of the Circle" (pp. 29-30).

The circle `S¹ ⊆ ℝ²` is realised as `Circle`, the unit circle in `ℂ`, so a point
`(cos θ, sin θ) ∈ ℝ²` is `e^{iθ} ∈ ℂ` and the basepoint `(1, 0)` is `1 : Circle`.
-/

namespace Hatcher

open Real

/-- Hatcher's map `p : ℝ → S¹`, `p(s) = (cos 2πs, sin 2πs)`, i.e. `p(s) = e^{2πis}`. -/
noncomputable def circleCover (s : ℝ) : Circle := Circle.exp (2 * π * s)

theorem continuous_circleCover : Continuous circleCover :=
  Circle.exp.continuous.comp (continuous_const.mul continuous_id)

@[simp] theorem circleCover_zero : circleCover 0 = 1 := by
  simp [circleCover]

@[simp] theorem circleCover_intCast (n : ℤ) : circleCover n = 1 := by
  simp [circleCover, Circle.exp_two_pi_mul_int]

/-- Hatcher's loop `ω_n(s) = (cos 2πns, sin 2πns)`, `n ∈ ℤ`, based at `(1, 0)`. -/
noncomputable def omegaLoopN (n : ℤ) : Path (1 : Circle) 1 where
  toFun s := circleCover (n * s)
  continuous_toFun := continuous_circleCover.comp (continuous_const.mul continuous_subtype_val)
  source' := by simp
  target' := by simp

/-- Hatcher's loop `ω(s) = (cos 2πs, sin 2πs)` based at `(1, 0)`; it is `ω_1`. -/
noncomputable def omegaLoop : Path (1 : Circle) 1 where
  toFun s := circleCover s
  continuous_toFun := continuous_circleCover.comp continuous_subtype_val
  source' := by simp
  target' := by simpa using circleCover_intCast 1

@[simp] theorem omegaLoopN_apply (n : ℤ) (s : unitInterval) : omegaLoopN n s = circleCover (n * s) := rfl

@[simp] theorem omegaLoop_apply (s : unitInterval) : omegaLoop s = circleCover s := rfl

theorem omegaLoopN_one : omegaLoopN 1 = omegaLoop := by
  ext s; simp

/-- The homotopy class `[ω] ∈ π₁(S¹, (1, 0))`, as an element of Mathlib's `FundamentalGroup Circle 1`. -/
noncomputable def omegaClass : FundamentalGroup Circle 1 := FundamentalGroup.fromPath ⟦omegaLoop⟧

end Hatcher
