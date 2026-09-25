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

import Definitions.Def_BirkhoffShootingArcs

namespace BirkhoffGlobalSection

theorem birkhoff_far_axis_exclusion (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c)
    (φ : Flow ℝ (LeftEnergyState μ c))
    (hφ : IsLeviCivitaHamiltonianFlow μ c φ)
    (x : LeftEnergyState μ c) (T : ℝ) (hT : 0 < T)
    (hx0 : (x : Phase) 0 = 0) (hx1 : 0 < (x : Phase) 1)
    (hv : jacobiVelocity (leviCivitaToJacobi μ (x : Phase)) 1 < 0)
    (hcl : ∀ t ∈ Set.Ioo 0 T, relativePosition μ ((φ t x : LeftEnergyState μ c) : Phase) 1 ≤ 0)
    (hvx : ∀ t ∈ Set.Ioo 0 T, 0 < jacobiVelocity (leviCivitaToJacobi μ ((φ t x : LeftEnergyState μ c) : Phase)) 0)
    (hP : ∀ t ∈ Set.Ioo 0 T, 0 < zNormSq ((φ t x : LeftEnergyState μ c) : Phase)) :
    ∀ t ∈ Set.Ioo 0 T, relativePosition μ ((φ t x : LeftEnergyState μ c) : Phase) 1 < 0 := by sorry

end BirkhoffGlobalSection
