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

import Theorems.Thm_BirkhoffGlobalSection_left_negative_boundary_radial_interior_negative
import Mathlib.Tactic.Linarith

open BirkhoffGlobalSection

theorem solution (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∀ x : {x : Phase // x ∈ unitThreeSphere},
      ∀ r t : ℝ, 0 < r → 0 < t →
      (fun i : Fin 4 => r * (x : Phase) i) ∈
        {s : Phase | s ∈ closure
          (connectedComponentIn
            {u : Phase | leviCivitaHamiltonian μ c u < 0 ∧
              0 < secondCollisionDistanceSq u}
            (fun _ : Fin 4 => (0 : ℝ))) ∧
          leviCivitaHamiltonian μ c s = 0 ∧
          0 < secondCollisionDistanceSq s} →
      (fun i : Fin 4 => t * (x : Phase) i) ∈
        {s : Phase | s ∈ closure
          (connectedComponentIn
            {u : Phase | leviCivitaHamiltonian μ c u < 0 ∧
              0 < secondCollisionDistanceSq u}
            (fun _ : Fin 4 => (0 : ℝ))) ∧
          leviCivitaHamiltonian μ c s = 0 ∧
          0 < secondCollisionDistanceSq s} →
      r = t := by
  intro x r t hr ht hsr hst
  rcases lt_trichotomy r t with hlt | heq | hgt
  · have hneg := left_negative_boundary_radial_interior_negative
      μ c hμ0 hμ1 hc x t ht hst r hr.le hlt
    have hzero : leviCivitaHamiltonian μ c
        (fun i : Fin 4 => r * (x : Phase) i) = 0 := hsr.2.1
    linarith
  · exact heq
  · have hneg := left_negative_boundary_radial_interior_negative
      μ c hμ0 hμ1 hc x r hr hsr t ht.le hgt
    have hzero : leviCivitaHamiltonian μ c
        (fun i : Fin 4 => t * (x : Phase) i) = 0 := hst.2.1
    linarith
