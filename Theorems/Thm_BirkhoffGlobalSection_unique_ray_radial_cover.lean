import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem unique_ray_radial_cover (S : Set Phase)
    (hzero : (fun _ : Fin 4 => (0 : ℝ)) ∉ S)
    (hunique : ∀ x : {x : Phase // x ∈ unitThreeSphere},
      ∃! r : ℝ, 0 < r ∧
        (fun i : Fin 4 => r * (x : Phase) i) ∈ S) :
    S = Set.range (fun x : {x : Phase // x ∈ unitThreeSphere} =>
      (fun i : Fin 4 =>
        Classical.choose (hunique x).exists * (x : Phase) i)) := by sorry

end BirkhoffGlobalSection
