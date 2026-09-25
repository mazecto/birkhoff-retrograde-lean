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

import Theorems.Thm_BirkhoffGlobalSection_left_energy_component_compact
import Theorems.Thm_BirkhoffGlobalSection_left_energy_component_regular
import Theorems.Thm_BirkhoffGlobalSection_left_energy_component_equivariant_sphere
import Theorems.Thm_BirkhoffGlobalSection_antipodal_symmetry
import Theorems.Thm_BirkhoffGlobalSection_leviCivita_smoothAt_of_secondCollisionFree

open BirkhoffGlobalSection
open scoped ContDiff

theorem solution (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    IsCompact (leftEnergyComponent μ c) ∧
    (∀ s ∈ leftEnergyComponent μ c,
      ContDiffAt ℝ ∞ (leviCivitaHamiltonian μ c) s ∧
      fderiv ℝ (leviCivitaHamiltonian μ c) s ≠ 0) ∧
    IsAntipodallyInvariantComponent μ c ∧
    IsAntipodallyFreeComponent μ c ∧
    ∃ e : LeftEnergyState μ c ≃ₜ
        {x : Phase // x ∈ unitThreeSphere},
      IsAntipodallyEquivariantSphereHomeomorph e := by
  obtain ⟨_, hinv, hfree⟩ := antipodal_symmetry μ c hμ0 hμ1 hc
  refine ⟨left_energy_component_compact μ c hμ0 hμ1 hc, ?_, hinv, hfree,
    left_energy_component_equivariant_sphere μ c hμ0 hμ1 hc⟩
  intro s hs
  have hreg : s ∈ regularEnergyLocus μ c :=
    connectedComponentIn_subset (regularEnergyLocus μ c) (leftCollisionPoint μ) hs
  have hD : 0 < secondCollisionDistanceSq s := hreg.2
  exact ⟨leviCivita_smoothAt_of_secondCollisionFree μ c s hD,
    left_energy_component_regular μ c hμ0 hμ1 hc s hs⟩
