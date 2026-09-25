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

import Mathlib
import Theorems.Thm_BirkhoffGlobalSection_left_component_second_collision_separated

open BirkhoffGlobalSection

theorem solution (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∀ s ∈ closure (leftEnergyComponent μ c),
      0 < secondCollisionDistanceSq s := by
  obtain ⟨δ, hδ, hsep⟩ :=
    left_component_second_collision_separated μ c hμ0 hμ1 hc
  have hdcont : Continuous (fun t : Phase =>
      Real.sqrt (secondCollisionDistanceSq t)) := by
    dsimp [secondCollisionDistanceSq]
    fun_prop
  have hclosed : IsClosed {t : Phase |
      δ ≤ Real.sqrt (secondCollisionDistanceSq t)} :=
    isClosed_Ici.preimage hdcont
  have hsepclosure : closure (leftEnergyComponent μ c) ⊆
      {t : Phase | δ ≤ Real.sqrt (secondCollisionDistanceSq t)} :=
    hclosed.closure_subset_iff.mpr (by
      intro t ht
      exact hsep t ht)
  intro s hs
  have hsqrt : 0 < Real.sqrt (secondCollisionDistanceSq s) :=
    lt_of_lt_of_le hδ (hsepclosure hs)
  exact Real.sqrt_pos.mp hsqrt
