import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem compact_unique_ray_radial_graph (S : Set Phase)
    (hcompact : IsCompact S)
    (hzero : (fun _ : Fin 4 => (0 : ℝ)) ∉ S)
    (hunique : ∀ x : {x : Phase // x ∈ unitThreeSphere},
      ∃! r : ℝ, 0 < r ∧
        (fun i : Fin 4 => r * (x : Phase) i) ∈ S) :
    ∃ ρ : {x : Phase // x ∈ unitThreeSphere} → ℝ,
      Continuous ρ ∧
      (∀ x, 0 < ρ x) ∧
      S = Set.range (fun x : {x : Phase // x ∈ unitThreeSphere} =>
        (fun i : Fin 4 => ρ x * (x : Phase) i)) := by sorry

end BirkhoffGlobalSection
