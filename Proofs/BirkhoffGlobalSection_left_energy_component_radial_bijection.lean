import Theorems.Thm_BirkhoffGlobalSection_left_component_radial_projection_continuous
import Theorems.Thm_BirkhoffGlobalSection_left_component_unique_ray_intersection

open BirkhoffGlobalSection

theorem solution (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∃ f : LeftEnergyState μ c → {x : Phase // x ∈ unitThreeSphere},
      Continuous f ∧ Function.Bijective f ∧
        ∀ s, (f s : Phase) =
          fun i => (s : Phase) i /
            Real.sqrt (zNormSq (s : Phase) + wNormSq (s : Phase)) := by
  obtain ⟨f, hcont, hrad⟩ :=
    left_component_radial_projection_continuous μ c hμ0 hμ1 hc
  exact ⟨f, hcont,
    left_component_unique_ray_intersection μ c hμ0 hμ1 hc f hrad,
    hrad⟩
