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

import Theorems.Thm_BirkhoffGlobalSection_left_negative_boundary_compact
import Theorems.Thm_BirkhoffGlobalSection_left_negative_boundary_unique_positive_ray
import Theorems.Thm_BirkhoffGlobalSection_compact_unique_ray_radial_graph
import Mathlib.Tactic

open BirkhoffGlobalSection

theorem solution (μ c : ℝ)
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
          (fun i : Fin 4 => ρ x * (x : Phase) i)) := by
  let B : Set Phase :=
    {s | s ∈ closure
      (connectedComponentIn
        {t : Phase | leviCivitaHamiltonian μ c t < 0 ∧
          0 < secondCollisionDistanceSq t}
        (fun _ : Fin 4 => (0 : ℝ))) ∧
      leviCivitaHamiltonian μ c s = 0 ∧
      0 < secondCollisionDistanceSq s}
  have hcompact : IsCompact B :=
    left_negative_boundary_compact μ c hμ0 hμ1 hc
  have hunique : ∀ x : {x : Phase // x ∈ unitThreeSphere},
      ∃! r : ℝ, 0 < r ∧
        (fun i : Fin 4 => r * (x : Phase) i) ∈ B :=
    left_negative_boundary_unique_positive_ray μ c hμ0 hμ1 hc
  have hK0 : leviCivitaHamiltonian μ c
      (fun _ : Fin 4 => (0 : ℝ)) = -(1 - μ) / 2 := by
    dsimp [leviCivitaHamiltonian, wNormSq, zNormSq,
      secondCollisionDistanceSq]
    norm_num <;> ring
  have hzero : (fun _ : Fin 4 => (0 : ℝ)) ∉ B := by
    intro hz
    have hk : leviCivitaHamiltonian μ c
        (fun _ : Fin 4 => (0 : ℝ)) = 0 := hz.2.1
    rw [hK0] at hk
    linarith
  exact compact_unique_ray_radial_graph B hcompact hzero hunique
