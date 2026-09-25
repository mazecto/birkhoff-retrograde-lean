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

import Mathlib.Topology.MetricSpace.Bounded
import Mathlib.Topology.Bornology.Constructions
import Mathlib.Tactic.FinCases
import Theorems.Thm_BirkhoffGlobalSection_left_component_position_coordinates_bounded
import Theorems.Thm_BirkhoffGlobalSection_left_component_momentum_coordinates_bounded

open BirkhoffGlobalSection

theorem solution (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    Bornology.IsBounded (leftEnergyComponent μ c) := by
  obtain ⟨Rz, hz⟩ := left_component_position_coordinates_bounded μ c hμ0 hμ1 hc
  obtain ⟨Rw, hw⟩ := left_component_momentum_coordinates_bounded μ c hμ0 hμ1 hc
  let R : ℝ := max Rz Rw
  have hcoord : ∀ s ∈ leftEnergyComponent μ c, ∀ i : Fin 4, |s i| ≤ R := by
    intro s hs i
    fin_cases i
    · exact (hz s hs).1.trans (le_max_left Rz Rw)
    · exact (hz s hs).2.trans (le_max_left Rz Rw)
    · exact (hw s hs).1.trans (le_max_right Rz Rw)
    · exact (hw s hs).2.trans (le_max_right Rz Rw)
  have hsubset : leftEnergyComponent μ c ⊆
      Set.pi Set.univ (fun _ : Fin 4 => Set.Icc (-R) R) := by
    intro s hs i hi
    exact abs_le.mp (hcoord s hs i)
  exact (Bornology.IsBounded.pi (fun _ : Fin 4 => Metric.isBounded_Icc (-R) R)).subset
    hsubset
