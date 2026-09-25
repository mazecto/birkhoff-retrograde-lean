import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem phase_polar_homeomorph :
    ∃ e : {s : Phase // s ≠ (fun _ : Fin 4 => (0 : ℝ))} ≃ₜ
      ({x : Phase // x ∈ unitThreeSphere} × {r : ℝ // 0 < r}),
      ∀ x : {x : Phase // x ∈ unitThreeSphere},
        ∀ r : {r : ℝ // 0 < r},
          ((e.symm (x, r) :
            {s : Phase // s ≠ (fun _ : Fin 4 => (0 : ℝ))}) : Phase) =
            (fun i : Fin 4 => (r : ℝ) * (x : Phase) i) := by sorry

end BirkhoffGlobalSection
