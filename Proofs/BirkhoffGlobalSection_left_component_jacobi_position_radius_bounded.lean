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

import Mathlib.Topology.Connected.Basic
import Mathlib.Tactic.FunProp
import Theorems.Thm_BirkhoffGlobalSection_left_subcritical_hill_circle_barrier

open BirkhoffGlobalSection

theorem solution (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∃ Rq : ℝ, ∀ s ∈ leftEnergyComponent μ c,
      ((leviCivitaPosition μ s) 0 + μ) ^ 2 +
        ((leviCivitaPosition μ s) 1) ^ 2 ≤ Rq := by
  obtain ⟨Rq, hRq, hbar⟩ := left_subcritical_hill_circle_barrier μ c hμ0 hμ1 hc
  let f : Phase → ℝ := fun s =>
    ((leviCivitaPosition μ s) 0 + μ) ^ 2 +
      ((leviCivitaPosition μ s) 1) ^ 2
  have hf : Continuous f := by
    dsimp [f, leviCivitaPosition]
    fun_prop
  by_cases hx : leftCollisionPoint μ ∈ regularEnergyLocus μ c
  · have hbase : leftCollisionPoint μ ∈ leftEnergyComponent μ c :=
      mem_connectedComponentIn hx
    have hzero : f (leftCollisionPoint μ) = 0 := by
      simp [f, leviCivitaPosition, leftCollisionPoint]
    have hbelow : f (leftCollisionPoint μ) < Rq := by
      rw [hzero]
      exact hRq
    have hne : ∀ s ∈ leftEnergyComponent μ c, f s ≠ Rq := by
      intro s hs
      exact hbar s (connectedComponentIn_subset _ _ hs)
    refine ⟨Rq, ?_⟩
    intro s hs
    exact le_of_lt (isPreconnected_connectedComponentIn.gt_of_ne
      hf.continuousOn hne ⟨leftCollisionPoint μ, hbase, hbelow⟩ hs)
  · refine ⟨0, ?_⟩
    intro s hs
    have he : leftEnergyComponent μ c = ∅ := connectedComponentIn_eq_empty hx
    exact (he ▸ hs).elim
