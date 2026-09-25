import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem compact_unique_ray_graph_compact (S : Set Phase)
    (hcompact : IsCompact S)
    (hzero : (fun _ : Fin 4 => (0 : ℝ)) ∉ S) :
    IsCompact
      {p : {x : Phase // x ∈ unitThreeSphere} × ℝ |
        0 < p.2 ∧
        (fun i : Fin 4 => p.2 * (p.1 : Phase) i) ∈ S} := by sorry

end BirkhoffGlobalSection
