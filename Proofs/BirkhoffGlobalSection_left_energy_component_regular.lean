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

import Mathlib.Tactic.Positivity
import Theorems.Thm_BirkhoffGlobalSection_leviCivita_regularAt_left_collision
import Theorems.Thm_BirkhoffGlobalSection_leviCivita_regularAt_collisionFree_subcritical_energy

open BirkhoffGlobalSection

theorem solution (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∀ s ∈ leftEnergyComponent μ c,
      fderiv ℝ (leviCivitaHamiltonian μ c) s ≠ 0 := by
  intro s hs
  have hreg : s ∈ regularEnergyLocus μ c :=
    connectedComponentIn_subset (regularEnergyLocus μ c) (leftCollisionPoint μ) hs
  have hK : leviCivitaHamiltonian μ c s = 0 := hreg.1
  have hD : 0 < secondCollisionDistanceSq s := hreg.2
  have hznonneg : 0 ≤ zNormSq s := by
    unfold zNormSq
    positivity
  by_cases hz : zNormSq s = 0
  · exact leviCivita_regularAt_left_collision μ c hμ1 s hK hz
  · have hzpos : 0 < zNormSq s := lt_of_le_of_ne hznonneg (Ne.symm hz)
    exact leviCivita_regularAt_collisionFree_subcritical_energy
      μ c hμ0 hμ1 hc s hK hD hzpos
