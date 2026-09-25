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

theorem left_negative_boundary_radial_graph (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∃ ρ : {x : Phase // x ∈ unitThreeSphere} → ℝ,
      Continuous ρ ∧
      (∀ x, 0 < ρ x) ∧
      {s : Phase | s ∈ closure
        (connectedComponentIn
          {t : Phase | leviCivitaHamiltonian μ c t < 0 ∧
            0 < secondCollisionDistanceSq t}
          (fun _ : Fin 4 => (0 : ℝ))) ∧
        leviCivitaHamiltonian μ c s = 0 ∧
        0 < secondCollisionDistanceSq s} =
        Set.range (fun x : {x : Phase // x ∈ unitThreeSphere} =>
          (fun i : Fin 4 => ρ x * (x : Phase) i)) := by sorry

end BirkhoffGlobalSection
