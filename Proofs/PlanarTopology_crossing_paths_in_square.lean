import Theorems.Thm_Hatcher_brouwer_fixed_point_disk
import Mathlib

open Set

theorem solution (f g : ℝ → ℝ × ℝ)
    (hf : ContinuousOn f (Set.Icc (-1) 1)) (hg : ContinuousOn g (Set.Icc (-1) 1))
    (hfK : ∀ s ∈ Set.Icc (-1 : ℝ) 1, |(f s).1| ≤ 1 ∧ |(f s).2| ≤ 1)
    (hgK : ∀ t ∈ Set.Icc (-1 : ℝ) 1, |(g t).1| ≤ 1 ∧ |(g t).2| ≤ 1)
    (hf₀ : (f (-1)).1 = -1) (hf₁ : (f 1).1 = 1)
    (hg₀ : (g (-1)).2 = -1) (hg₁ : (g 1).2 = 1) :
    ∃ s ∈ Set.Icc (-1 : ℝ) 1, ∃ t ∈ Set.Icc (-1 : ℝ) 1, f s = g t := by
  by_contra hno
  push_neg at hno
  -- clamping the parameters to `[-1, 1]`
  set cl : ℝ → ℝ := fun u => max (-1) (min 1 u) with hcl
  have hcl_mem : ∀ u, cl u ∈ Icc (-1 : ℝ) 1 := fun u =>
    ⟨le_max_left _ _, max_le (by norm_num) (min_le_left _ _)⟩
  have hcl_id : ∀ u ∈ Icc (-1 : ℝ) 1, cl u = u := fun u hu => by
    simp only [hcl]; rw [min_eq_right hu.2, max_eq_right hu.1]
  have hcl_c : Continuous cl := by simp only [hcl]; fun_prop
  set E := EuclideanSpace ℝ (Fin 2)
  have hsC : Continuous (fun x : E => cl (2 * x 0)) :=
    hcl_c.comp (continuous_const.mul (PiLp.continuous_apply 2 _ 0))
  have htC : Continuous (fun x : E => cl (2 * x 1)) :=
    hcl_c.comp (continuous_const.mul (PiLp.continuous_apply 2 _ 1))
  set F : E → ℝ × ℝ := fun x => f (cl (2 * x 0)) with hF
  set G : E → ℝ × ℝ := fun x => g (cl (2 * x 1)) with hG
  have hFc : Continuous F := hf.comp_continuous hsC (fun x => hcl_mem _)
  have hGc : Continuous G := hg.comp_continuous htC (fun x => hcl_mem _)
  -- the sup-distance between the two points is positive
  set N : E → ℝ := fun x => max |(G x).1 - (F x).1| |(F x).2 - (G x).2| with hN
  have hNc : Continuous N := by
    simp only [hN]
    exact ((((continuous_fst.comp hGc).sub (continuous_fst.comp hFc)).abs).max
      (((continuous_snd.comp hFc).sub (continuous_snd.comp hGc)).abs))
  have hNpos : ∀ x, 0 < N x := by
    intro x
    have hne := hno _ (hcl_mem (2 * x 0)) _ (hcl_mem (2 * x 1))
    by_contra hle
    push_neg at hle
    apply hne
    have h1 : (G x).1 - (F x).1 = 0 := abs_nonpos_iff.1 (le_trans (le_max_left _ _) hle)
    have h2 : (F x).2 - (G x).2 = 0 := abs_nonpos_iff.1 (le_trans (le_max_right _ _) hle)
    exact Prod.ext (by simp only [hF, hG] at h1; linarith) (by simp only [hF, hG] at h2; linarith)
  -- the self-map of the disk
  set Φ : E → E := fun x => !₂[((G x).1 - (F x).1) / (2 * N x), ((F x).2 - (G x).2) / (2 * N x)]
    with hΦ
  have hbd1 : ∀ x, |((G x).1 - (F x).1) / (2 * N x)| ≤ 1 / 2 := by
    intro x
    have hN0 := hNpos x
    rw [abs_div, abs_of_pos (by linarith : (0:ℝ) < 2 * N x), div_le_iff₀ (by linarith)]
    have := le_max_left |(G x).1 - (F x).1| |(F x).2 - (G x).2|
    simp only [hN] at hN0 ⊢; linarith
  have hbd2 : ∀ x, |((F x).2 - (G x).2) / (2 * N x)| ≤ 1 / 2 := by
    intro x
    have hN0 := hNpos x
    rw [abs_div, abs_of_pos (by linarith : (0:ℝ) < 2 * N x), div_le_iff₀ (by linarith)]
    have := le_max_right |(G x).1 - (F x).1| |(F x).2 - (G x).2|
    simp only [hN] at hN0 ⊢; linarith
  have hΦ0 : ∀ x, Φ x 0 = ((G x).1 - (F x).1) / (2 * N x) := fun x => by simp [hΦ]
  have hΦ1 : ∀ x, Φ x 1 = ((F x).2 - (G x).2) / (2 * N x) := fun x => by simp [hΦ]
  have hΦball : ∀ x, Φ x ∈ Metric.closedBall (0 : E) 1 := by
    intro x
    rw [mem_closedBall_zero_iff, EuclideanSpace.norm_eq, Fin.sum_univ_two, hΦ0, hΦ1]
    rw [Real.sqrt_le_one]
    have a := hbd1 x; have b := hbd2 x
    have a2 : ‖((G x).1 - (F x).1) / (2 * N x)‖ ^ 2 ≤ 1 / 4 := by
      rw [Real.norm_eq_abs, sq_abs]; nlinarith [abs_nonneg (((G x).1 - (F x).1) / (2 * N x)),
        sq_abs (((G x).1 - (F x).1) / (2 * N x))]
    have b2 : ‖((F x).2 - (G x).2) / (2 * N x)‖ ^ 2 ≤ 1 / 4 := by
      rw [Real.norm_eq_abs, sq_abs]; nlinarith [abs_nonneg (((F x).2 - (G x).2) / (2 * N x)),
        sq_abs (((F x).2 - (G x).2) / (2 * N x))]
    linarith
  have hΦc : Continuous Φ := by
    simp only [hΦ]
    apply (PiLp.continuous_toLp 2 _).comp
    apply continuous_pi
    intro i
    fin_cases i
    · exact (((continuous_fst.comp hGc).sub (continuous_fst.comp hFc)).div
        (continuous_const.mul hNc) (fun x => by have := hNpos x; positivity))
    · exact (((continuous_snd.comp hFc).sub (continuous_snd.comp hGc)).div
        (continuous_const.mul hNc) (fun x => by have := hNpos x; positivity))
  let h : C(Metric.closedBall (0 : E) 1, Metric.closedBall (0 : E) 1) :=
    ⟨fun x => ⟨Φ x, hΦball x⟩, (hΦc.comp continuous_subtype_val).subtype_mk _⟩
  obtain ⟨x, hx⟩ := Hatcher.brouwer_fixed_point_disk h
  have hx' : Φ (x : E) = (x : E) := congrArg Subtype.val hx
  have hu0 : (x : E) 0 = ((G x).1 - (F x).1) / (2 * N x) := by
    rw [← hΦ0]; exact (congrArg (fun y : E => y 0) hx').symm
  have hv0 : (x : E) 1 = ((F x).2 - (G x).2) / (2 * N x) := by
    rw [← hΦ1]; exact (congrArg (fun y : E => y 1) hx').symm
  have hNx := hNpos x
  -- the two parameters are the doubled coordinates
  have hs_mem : 2 * (x : E) 0 ∈ Icc (-1 : ℝ) 1 := by
    have := hbd1 x; rw [← hu0] at this
    constructor <;> [linarith [neg_abs_le ((x : E) 0)]; linarith [le_abs_self ((x : E) 0)]]
  have ht_mem : 2 * (x : E) 1 ∈ Icc (-1 : ℝ) 1 := by
    have := hbd2 x; rw [← hv0] at this
    constructor <;> [linarith [neg_abs_le ((x : E) 1)]; linarith [le_abs_self ((x : E) 1)]]
  have hFx : F x = f (2 * (x : E) 0) := by simp only [hF]; rw [hcl_id _ hs_mem]
  have hGx : G x = g (2 * (x : E) 1) := by simp only [hG]; rw [hcl_id _ ht_mem]
  have hgt := hgK _ ht_mem
  have hfs := hfK _ hs_mem
  set A := (G x).1 - (F x).1 with hA
  set B := (F x).2 - (G x).2 with hB
  have hA2 : 2 * (x : E) 0 * N x = A := by rw [hu0]; field_simp
  have hB2 : 2 * (x : E) 1 * N x = B := by rw [hv0]; field_simp
  rcases max_choice |A| |B| with hm | hm
  · -- the first coordinate sits on a vertical side
    have hAN : |A| = N x := by simp only [hN]; rw [hm]
    rcases abs_eq (le_of_lt hNx) |>.1 hAN with hA' | hA'
    · have hs1 : 2 * (x : E) 0 = 1 := by
        have : 2 * (x : E) 0 * N x = 1 * N x := by rw [hA2, hA']; ring
        exact mul_right_cancel₀ hNx.ne' this
      rw [hA, hFx, hGx, hs1, hf₁] at hA'
      linarith [le_abs_self (g (2 * (x : E) 1)).1, hgt.1]
    · have hs1 : 2 * (x : E) 0 = -1 := by
        have : 2 * (x : E) 0 * N x = -1 * N x := by rw [hA2, hA']; ring
        exact mul_right_cancel₀ hNx.ne' this
      rw [hA, hFx, hGx, hs1, hf₀] at hA'
      linarith [neg_abs_le (g (2 * (x : E) 1)).1, hgt.1]
  · -- the second coordinate sits on a horizontal side
    have hBN : |B| = N x := by simp only [hN]; rw [hm]
    rcases abs_eq (le_of_lt hNx) |>.1 hBN with hB' | hB'
    · have ht1 : 2 * (x : E) 1 = 1 := by
        have : 2 * (x : E) 1 * N x = 1 * N x := by rw [hB2, hB']; ring
        exact mul_right_cancel₀ hNx.ne' this
      rw [hB, hFx, hGx, ht1, hg₁] at hB'
      linarith [le_abs_self (f (2 * (x : E) 0)).2, hfs.2]
    · have ht1 : 2 * (x : E) 1 = -1 := by
        have : 2 * (x : E) 1 * N x = -1 * N x := by rw [hB2, hB']; ring
        exact mul_right_cancel₀ hNx.ne' this
      rw [hB, hFx, hGx, ht1, hg₀] at hB'
      linarith [neg_abs_le (f (2 * (x : E) 0)).2, hfs.2]
