/-
Copyright 2026 Dhia Eddine Ramdani

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-/

import Theorems.Thm_BirkhoffGlobalSection_compact_unique_ray_radius_continuous
import Theorems.Thm_BirkhoffGlobalSection_unique_ray_radial_cover

open BirkhoffGlobalSection

theorem solution (S : Set Phase)
    (hcompact : IsCompact S)
    (hzero : (fun _ : Fin 4 => (0 : ℝ)) ∉ S)
    (hunique : ∀ x : {x : Phase // x ∈ unitThreeSphere},
      ∃! r : ℝ, 0 < r ∧
        (fun i : Fin 4 => r * (x : Phase) i) ∈ S) :
    ∃ ρ : {x : Phase // x ∈ unitThreeSphere} → ℝ,
      Continuous ρ ∧
      (∀ x, 0 < ρ x) ∧
      S = Set.range (fun x : {x : Phase // x ∈ unitThreeSphere} =>
        (fun i : Fin 4 => ρ x * (x : Phase) i)) := by
  let ρ : {x : Phase // x ∈ unitThreeSphere} → ℝ :=
    fun x => Classical.choose (hunique x).exists
  refine ⟨ρ, ?_, ?_, ?_⟩
  · exact compact_unique_ray_radius_continuous S hcompact hzero hunique
  · intro x
    exact (Classical.choose_spec (hunique x).exists).1
  · exact unique_ray_radial_cover S hzero hunique
