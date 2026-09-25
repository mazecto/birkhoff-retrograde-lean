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

import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem regularized_ray_first_zero_exists (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (x : Phase) (R : ℝ) (hR : 0 < R)
    (hpositive : 0 < leviCivitaHamiltonian μ c
      (fun i : Fin 4 => R * x i))
    (hfree : ∀ r : ℝ, 0 ≤ r → r ≤ R →
      0 < secondCollisionDistanceSq (fun i : Fin 4 => r * x i)) :
    ∃ r : ℝ, 0 < r ∧ r < R ∧
      leviCivitaHamiltonian μ c (fun i : Fin 4 => r * x i) = 0 ∧
      ∀ t : ℝ, 0 ≤ t → t < r →
        leviCivitaHamiltonian μ c (fun i : Fin 4 => t * x i) < 0 := by sorry

end BirkhoffGlobalSection
