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

/-- At the position circle through the inner collinear equilibrium, its
effective potential is maximal. Completing the momentum squares gives this
lower bound on the zero-offset Levi-Civita Hamiltonian. -/
theorem inner_lagrange_circle_hamiltonian_lower_bound (μ : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) (L : Phase)
    (hL : IsInnerLagrangePoint μ L) (s : Phase)
    (hr : ((leviCivitaPosition μ s) 0 + μ) ^ 2 +
      ((leviCivitaPosition μ s) 1) ^ 2 = (L 0 + μ) ^ 2) :
    zNormSq s * jacobiHamiltonian μ L ≤ leviCivitaHamiltonian μ 0 s := by sorry

end BirkhoffGlobalSection
