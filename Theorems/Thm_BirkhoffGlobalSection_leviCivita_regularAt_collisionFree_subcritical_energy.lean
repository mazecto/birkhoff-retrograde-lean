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

/-- Away from both collisions the Levi-Civita coordinate map is locally
invertible; a critical point at subcritical energy would give a Jacobi
critical value below the first one. -/
theorem leviCivita_regularAt_collisionFree_subcritical_energy (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) (s : Phase)
    (hK : leviCivitaHamiltonian μ c s = 0)
    (hD : 0 < secondCollisionDistanceSq s)
    (hz : 0 < zNormSq s) :
    fderiv ℝ (leviCivitaHamiltonian μ c) s ≠ 0 := by sorry

end BirkhoffGlobalSection
