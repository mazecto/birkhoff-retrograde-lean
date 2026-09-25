import Mathlib
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith

theorem solution (a u : ℝ) (ha : 0 ≤ a) (hu : 0 < u) (hu1 : u < 1) :
    (a + u) ^ 2 / 2 + a / (1 + u) ≤
      (a - u) ^ 2 / 2 + a / (1 - u) := by
  have hleft : 0 < 1 - u := by linarith
  have hright : 0 < 1 + u := by linarith
  have hden : 0 < 1 - u ^ 2 := by
    nlinarith [mul_pos hleft hright]
  have heq : (a - u) ^ 2 / 2 + a / (1 - u) -
      ((a + u) ^ 2 / 2 + a / (1 + u)) =
      2 * a * u ^ 3 / (1 - u ^ 2) := by
    have hln : 1 - u ≠ 0 := ne_of_gt hleft
    have hrn : 1 + u ≠ 0 := ne_of_gt hright
    have hdn : 1 - u ^ 2 ≠ 0 := ne_of_gt hden
    field_simp <;> ring
  have hge : 0 ≤ 2 * a * u ^ 3 / (1 - u ^ 2) :=
    div_nonneg (mul_nonneg (mul_nonneg (by norm_num) ha) (pow_nonneg (le_of_lt hu) _))
      (le_of_lt hden)
  linarith
