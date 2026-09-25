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

import Theorems.Thm_BirkhoffGlobalSection_left_negative_closure_position_coordinates_bounded
import Theorems.Thm_BirkhoffGlobalSection_left_negative_closure_uniform_collision_gap
import Theorems.Thm_BirkhoffGlobalSection_left_negative_closure_nonpositive_energy
import Theorems.Thm_BirkhoffGlobalSection_nonpositive_regular_energy_momentum_bound

open BirkhoffGlobalSection

theorem solution (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∃ R : ℝ, ∀ s ∈ closure
      (connectedComponentIn
        {t : Phase | leviCivitaHamiltonian μ c t < 0 ∧
          0 < secondCollisionDistanceSq t}
        (fun _ : Fin 4 => (0 : ℝ))),
      |s 2| ≤ R ∧ |s 3| ≤ R := by
  obtain ⟨P, hP⟩ :=
    left_negative_closure_position_coordinates_bounded μ c hμ0 hμ1 hc
  obtain ⟨δ, hδ, hgap⟩ :=
    left_negative_closure_uniform_collision_gap μ c hμ0 hμ1 hc
  obtain ⟨M, hM⟩ :=
    nonpositive_regular_energy_momentum_bound μ c P δ hδ
  refine ⟨M, ?_⟩
  intro s hs
  exact hM s (hP s hs).1 (hP s hs).2 (hgap s hs)
    (left_negative_closure_nonpositive_energy μ c hμ0 hμ1 hc s hs)
