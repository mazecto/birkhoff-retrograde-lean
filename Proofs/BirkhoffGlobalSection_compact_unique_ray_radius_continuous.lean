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
