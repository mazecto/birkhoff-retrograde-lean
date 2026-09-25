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
import Mathlib.Order.Filter.Basic
import Mathlib.Topology.Order.Basic

namespace BirkhoffGlobalSection

theorem birkhoff_far_arc_end_rest (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c)
    (φ : Flow ℝ (LeftEnergyState μ c))
    (hφ : IsLeviCivitaHamiltonianFlow μ c φ)
    (b : ℝ) (hb : 0 < b)
    (hgood : ∀ r ∈ Set.Ioo 0 b, ∃ x : LeftEnergyState μ c, (x : Phase) = farShootingStart μ c r ∧ ∃ τ : ℝ, IsFarShootingArc φ x τ)
    (hbad : ¬ (∃ x : LeftEnergyState μ c, (x : Phase) = farShootingStart μ c b ∧ ∃ τ : ℝ, IsFarShootingArc φ x τ)) :
    ∃ E : ℝ × ℝ,
      ((((E.1 = -1 ∨ E.1 = 1) ∧ 0 < E.2) ∨ (E.2 = 0 ∧ Real.sqrt 2 / 2 < E.1)) ∧
        ∀ η > 0, ∃ δ > 0, ∀ r ∈ Set.Ioo (b - δ) b, ∀ x : LeftEnergyState μ c, ∀ τ : ℝ,
          (x : Phase) = farShootingStart μ c r → IsFarShootingArc φ x τ →
            dist (shootingCoordinates μ ((φ τ x : LeftEnergyState μ c) : Phase)) E < η) ∨
      (0 < E.2 ∧
        (∀ s : LeftEnergyState μ c, relativePosition μ (s : Phase) 0 = 0 →
          relativePosition μ (s : Phase) 1 < 0 →
          0 < jacobiVelocity (leviCivitaToJacobi μ (s : Phase)) 0 →
          -relativePosition μ (s : Phase) 1 < E.2) ∧
        ∀ η > 0, ∃ δ > 0, ∀ r ∈ Set.Ioo (b - δ) b, ∀ x : LeftEnergyState μ c, ∀ τ : ℝ,
          (x : Phase) = farShootingStart μ c r → IsFarShootingArc φ x τ →
            |(shootingCoordinates μ ((φ τ x : LeftEnergyState μ c) : Phase)).2 - E.2| < η) := by sorry

end BirkhoffGlobalSection
