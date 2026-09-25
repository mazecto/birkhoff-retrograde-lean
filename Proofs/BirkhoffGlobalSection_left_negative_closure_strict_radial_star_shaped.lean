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

import Theorems.Thm_BirkhoffGlobalSection_left_negative_closure_radial_nonpositive
import Theorems.Thm_BirkhoffGlobalSection_left_negative_closure_no_interior_radial_zero

open BirkhoffGlobalSection

theorem solution (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∀ s ∈ closure
      (connectedComponentIn
        {u : Phase | leviCivitaHamiltonian μ c u < 0 ∧
          0 < secondCollisionDistanceSq u}
        (fun _ : Fin 4 => (0 : ℝ))),
      ∀ a : ℝ, 0 ≤ a → a < 1 →
        leviCivitaHamiltonian μ c
          (fun i : Fin 4 => a * s i) < 0 := by
  intro s hs a ha0 ha1
  have hle :=
    left_negative_closure_radial_nonpositive μ c hμ0 hμ1 hc
      s hs a ha0 ha1
  have hne :=
    left_negative_closure_no_interior_radial_zero μ c hμ0 hμ1 hc
      s hs a ha0 ha1
  by_contra hn
  exact hne (le_antisymm hle (le_of_not_gt hn))
