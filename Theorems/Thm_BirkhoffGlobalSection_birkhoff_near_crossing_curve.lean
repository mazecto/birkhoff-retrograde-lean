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

import Definitions.Def_BirkhoffShootingCoordinates
import Mathlib.Order.Filter.Basic
import Mathlib.Topology.Order.Basic

namespace BirkhoffGlobalSection

theorem birkhoff_near_crossing_curve (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c)
    (φ : Flow ℝ (LeftEnergyState μ c))
    (hφ : IsLeviCivitaHamiltonianFlow μ c φ) :
    ∃ b : ℝ, 0 < b ∧ ∃ α : ℝ, -1 < α ∧ α < -(Real.sqrt 2 / 2) ∧
      ∃ S : ℝ → LeftEnergyState μ c, ∃ T : ℝ → ℝ,
        ContinuousOn (fun r : ℝ =>
          shootingCoordinates μ ((φ (-T r) (S r) : LeftEnergyState μ c) : Phase)) (Set.Ioo 0 b) ∧
        Filter.Tendsto (fun r : ℝ =>
          shootingCoordinates μ ((φ (-T r) (S r) : LeftEnergyState μ c) : Phase))
          (nhdsWithin 0 (Set.Ioi 0)) (nhds (Real.sqrt 2 / 2, 0)) ∧
        Filter.Tendsto (fun r : ℝ =>
          shootingCoordinates μ ((φ (-T r) (S r) : LeftEnergyState μ c) : Phase))
          (nhdsWithin b (Set.Iio b)) (nhds (α, 0)) ∧
        ∀ r ∈ Set.Ioo 0 b,
          ((S r : LeftEnergyState μ c) : Phase) 1 = 0 ∧
          ((S r : LeftEnergyState μ c) : Phase) 2 = 0 ∧
          ((S r : LeftEnergyState μ c) : Phase) 0 ≠ 0 ∧
          0 < T r ∧
          (∀ t ∈ Set.Ioo (-T r) 0,
            0 < relativePosition μ ((φ t (S r) : LeftEnergyState μ c) : Phase) 0 ∧
            relativePosition μ ((φ t (S r) : LeftEnergyState μ c) : Phase) 1 < 0) ∧
          relativePosition μ ((φ (-T r) (S r) : LeftEnergyState μ c) : Phase) 1 < 0 ∧
          relativePosition μ ((φ (-T r) (S r) : LeftEnergyState μ c) : Phase) 0 = 0 := by sorry

end BirkhoffGlobalSection
