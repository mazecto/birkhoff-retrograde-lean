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

theorem nonvertical_ray_reaches_inner_circle
    (r : ℝ) (hr : 0 < r) (hr1 : r < 1)
    (x : Phase) (hx : 0 < zNormSq x) :
    ∃ R : ℝ, 0 < R ∧
      ((leviCivitaPosition 0 (fun i : Fin 4 => R * x i)) 0) ^ 2 +
        ((leviCivitaPosition 0 (fun i : Fin 4 => R * x i)) 1) ^ 2 = r ^ 2 ∧
      ∀ t : ℝ, 0 ≤ t → t ≤ R →
        0 < secondCollisionDistanceSq (fun i : Fin 4 => t * x i) := by sorry

end BirkhoffGlobalSection
