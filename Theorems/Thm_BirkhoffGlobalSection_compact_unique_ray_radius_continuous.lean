import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem compact_unique_ray_radius_continuous (S : Set Phase)
    (hcompact : IsCompact S)
    (hzero : (fun _ : Fin 4 => (0 : ℝ)) ∉ S)
    (hunique : ∀ x : {x : Phase // x ∈ unitThreeSphere},
      ∃! r : ℝ, 0 < r ∧
        (fun i : Fin 4 => r * (x : Phase) i) ∈ S) :
    Continuous (fun x : {x : Phase // x ∈ unitThreeSphere} =>
      Classical.choose (hunique x).exists) := by sorry

end BirkhoffGlobalSection
