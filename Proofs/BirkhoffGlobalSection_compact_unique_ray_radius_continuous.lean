import Theorems.Thm_BirkhoffGlobalSection_compact_unique_ray_graph_compact
import Theorems.Thm_BirkhoffGlobalSection_compact_unique_fiber_selection_continuous

open BirkhoffGlobalSection

theorem solution (S : Set Phase)
    (hcompact : IsCompact S)
    (hzero : (fun _ : Fin 4 => (0 : ℝ)) ∉ S)
    (hunique : ∀ x : {x : Phase // x ∈ unitThreeSphere},
      ∃! r : ℝ, 0 < r ∧
        (fun i : Fin 4 => r * (x : Phase) i) ∈ S) :
    Continuous (fun x : {x : Phase // x ∈ unitThreeSphere} =>
      Classical.choose (hunique x).exists) := by
  let G : Set ({x : Phase // x ∈ unitThreeSphere} × ℝ) :=
    {p | 0 < p.2 ∧ (fun i : Fin 4 => p.2 * (p.1 : Phase) i) ∈ S}
  have hgraph : IsCompact G :=
    compact_unique_ray_graph_compact S hcompact hzero
  have hfiber : ∀ x : {x : Phase // x ∈ unitThreeSphere},
      ∃! r : ℝ, (x, r) ∈ G := by
    intro x
    simpa only [G, Set.mem_setOf_eq] using hunique x
  simpa only [G] using
    (compact_unique_fiber_selection_continuous G hgraph hfiber)
