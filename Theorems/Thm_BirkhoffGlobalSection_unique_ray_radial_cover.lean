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
