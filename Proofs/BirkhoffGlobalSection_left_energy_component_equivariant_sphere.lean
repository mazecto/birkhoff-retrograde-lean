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

import Mathlib.Topology.Homeomorph.Lemmas
import Theorems.Thm_BirkhoffGlobalSection_left_energy_component_compact
import Theorems.Thm_BirkhoffGlobalSection_left_energy_component_radial_bijection

open BirkhoffGlobalSection

theorem solution (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∃ e : LeftEnergyState μ c ≃ₜ {x : Phase // x ∈ unitThreeSphere},
      IsAntipodallyEquivariantSphereHomeomorph e := by
  obtain ⟨f, hcont, hbij, hrad⟩ :=
    left_energy_component_radial_bijection μ c hμ0 hμ1 hc
  letI : CompactSpace (LeftEnergyState μ c) :=
    isCompact_iff_compactSpace.mp
      (left_energy_component_compact μ c hμ0 hμ1 hc)
  have hfhomeo : IsHomeomorph f :=
    isHomeomorph_iff_continuous_bijective.mpr ⟨hcont, hbij⟩
  let e : LeftEnergyState μ c ≃ₜ {x : Phase // x ∈ unitThreeSphere} :=
    hfhomeo.homeomorph f
  refine ⟨e, ?_⟩
  intro s₁ s₂ hs
  change (f s₂ : Phase) = -(f s₁ : Phase)
  rw [hrad s₂, hrad s₁]
  ext i
  simp [hs, zNormSq, wNormSq, neg_div]
