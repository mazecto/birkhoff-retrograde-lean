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

import Mathlib.Order.ConditionallyCompleteLattice.Basic
import Theorems.Thm_BirkhoffGlobalSection_inner_lagrange_point_exists
import Theorems.Thm_BirkhoffGlobalSection_inner_lagrange_minimizes_critical_energy

open BirkhoffGlobalSection

theorem solution (μ : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) :
    ∃ L : Phase, IsInnerLagrangePoint μ L ∧
      jacobiHamiltonian μ L = firstCriticalValue μ := by
  obtain ⟨L, hL⟩ := inner_lagrange_point_exists μ hμ0 hμ1
  have hmem : jacobiHamiltonian μ L ∈ criticalValueSet μ :=
    ⟨L, hL.1, hL.2.1, rfl⟩
  have hleast : IsLeast (criticalValueSet μ) (jacobiHamiltonian μ L) :=
    ⟨hmem, inner_lagrange_minimizes_critical_energy μ hμ0 hμ1 L hL⟩
  exact ⟨L, hL, hleast.csInf_eq.symm⟩
