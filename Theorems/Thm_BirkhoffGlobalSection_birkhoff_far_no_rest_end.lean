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

theorem birkhoff_far_no_rest_end (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c)
    (φ : Flow ℝ (LeftEnergyState μ c))
    (hφ : IsLeviCivitaHamiltonianFlow μ c φ)
    (b : ℝ) (hb : 0 < b)
    (hgood : ∀ r ∈ Set.Ioo 0 b, ∃ x : LeftEnergyState μ c, (x : Phase) = farShootingStart μ c r ∧ ∃ τ : ℝ, IsFarShootingArc φ x τ)
    (hbad : ¬ (∃ x : LeftEnergyState μ c, (x : Phase) = farShootingStart μ c b ∧ ∃ τ : ℝ, IsFarShootingArc φ x τ))
    (xb : LeftEnergyState μ c) (hxb : (xb : Phase) = farShootingStart μ c b)
    (T : ℝ) (hT : 0 < T)
    (hq : ∀ t ∈ Set.Ioo 0 T,
      relativePosition μ ((φ t xb : LeftEnergyState μ c) : Phase) 0 < 0 ∧
      relativePosition μ ((φ t xb : LeftEnergyState μ c) : Phase) 1 < 0 ∧
      0 < jacobiVelocity (leviCivitaToJacobi μ ((φ t xb : LeftEnergyState μ c) : Phase)) 0)
    (hX : relativePosition μ ((φ T xb : LeftEnergyState μ c) : Phase) 0 = 0)
    (hY : relativePosition μ ((φ T xb : LeftEnergyState μ c) : Phase) 1 < 0)
    (hv : jacobiVelocity (leviCivitaToJacobi μ ((φ T xb : LeftEnergyState μ c) : Phase)) 0 = 0) :
    jacobiVelocity (leviCivitaToJacobi μ ((φ T xb : LeftEnergyState μ c) : Phase)) 1 ≠ 0 := by sorry

end BirkhoffGlobalSection
