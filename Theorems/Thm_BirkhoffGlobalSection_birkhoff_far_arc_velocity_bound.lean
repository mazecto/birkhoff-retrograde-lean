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

theorem birkhoff_far_arc_velocity_bound (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c)
    (φ : Flow ℝ (LeftEnergyState μ c))
    (hφ : IsLeviCivitaHamiltonianFlow μ c φ)
    (r : ℝ) (hr : 0 < r)
    (hgood : ∀ r' ∈ Set.Ioc 0 r, ∃ x : LeftEnergyState μ c, (x : Phase) = farShootingStart μ c r' ∧ ∃ τ : ℝ, IsFarShootingArc φ x τ)
    (x : LeftEnergyState μ c) (hx : (x : Phase) = farShootingStart μ c r)
    (τ : ℝ) (harc : IsFarShootingArc φ x τ) :
    ∀ t ∈ Set.Ioo 0 τ,
      0 < jacobiVelocity (leviCivitaToJacobi μ ((φ t x : LeftEnergyState μ c) : Phase)) 0 +
        2 * relativePosition μ ((φ t x : LeftEnergyState μ c) : Phase) 1 := by sorry

end BirkhoffGlobalSection
