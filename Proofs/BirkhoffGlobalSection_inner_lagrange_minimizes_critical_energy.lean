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

import Theorems.Thm_BirkhoffGlobalSection_inner_lagrange_le_collinear_critical_energy
import Theorems.Thm_BirkhoffGlobalSection_noncollinear_critical_energy_value
import Theorems.Thm_BirkhoffGlobalSection_inner_lagrange_le_triangular_energy

open BirkhoffGlobalSection

theorem solution (μ : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) (L : Phase)
    (hL : IsInnerLagrangePoint μ L) :
    ∀ e ∈ criticalValueSet μ, jacobiHamiltonian μ L ≤ e := by
  intro e he
  obtain ⟨s, hfree, hcrit, hvalue⟩ := he
  rw [← hvalue]
  by_cases haxis : s 1 = 0
  · exact inner_lagrange_le_collinear_critical_energy μ hμ0 hμ1 L hL s hfree hcrit haxis
  · rw [noncollinear_critical_energy_value μ hμ0 hμ1 s hfree hcrit haxis]
    exact inner_lagrange_le_triangular_energy μ hμ0 hμ1 L hL
