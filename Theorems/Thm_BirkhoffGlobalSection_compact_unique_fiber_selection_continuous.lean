import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem compact_unique_fiber_selection_continuous
    (G : Set ({x : Phase // x ∈ unitThreeSphere} × ℝ))
    (hcompact : IsCompact G)
    (hunique : ∀ x : {x : Phase // x ∈ unitThreeSphere},
      ∃! r : ℝ, (x, r) ∈ G) :
    Continuous (fun x : {x : Phase // x ∈ unitThreeSphere} =>
      Classical.choose (hunique x).exists) := by sorry

end BirkhoffGlobalSection
