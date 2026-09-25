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

theorem birkhoff_near_arc_small (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c)
    (φ : Flow ℝ (LeftEnergyState μ c))
    (hφ : IsLeviCivitaHamiltonianFlow μ c φ) :
    ∃ ε > 0, (∀ r ∈ Set.Ioo 0 ε, ∃ x : LeftEnergyState μ c, (x : Phase) = nearShootingStart μ c r ∧ ∃ τ : ℝ, IsNearShootingArc φ x τ) ∧
      ∀ η > 0, ∃ δ > 0, ∀ r ∈ Set.Ioo 0 δ, ∀ x : LeftEnergyState μ c, ∀ τ : ℝ,
        (x : Phase) = nearShootingStart μ c r → IsNearShootingArc φ x τ →
          dist (shootingCoordinates μ ((φ (-τ) x : LeftEnergyState μ c) : Phase)) (Real.sqrt 2 / 2, 0) < η := by sorry

end BirkhoffGlobalSection
