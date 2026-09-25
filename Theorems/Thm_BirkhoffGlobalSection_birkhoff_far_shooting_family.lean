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

namespace BirkhoffGlobalSection

theorem birkhoff_far_shooting_family (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c)
    (φ : Flow ℝ (LeftEnergyState μ c))
    (hφ : IsLeviCivitaHamiltonianFlow μ c φ) :
    ∃ Γ : ℝ → ℝ × ℝ,
      ContinuousOn Γ (Set.Icc (-1) 1) ∧
      Γ (-1) = (-(Real.sqrt 2 / 2), 0) ∧
      ((((Γ 1).1 = -1 ∨ (Γ 1).1 = 1) ∧ 0 < (Γ 1).2) ∨
        ((Γ 1).2 = 0 ∧ Real.sqrt 2 / 2 < (Γ 1).1)) ∧
      (∀ t ∈ Set.Icc (-1 : ℝ) 1,
        -1 ≤ (Γ t).1 ∧ (Γ t).1 ≤ 1 ∧ 0 ≤ (Γ t).2 ∧ (Γ t).2 ≤ 1) ∧
      ∀ t ∈ Set.Ioo (-1 : ℝ) 1, 0 < (Γ t).2 ∧
        ∃ x : LeftEnergyState μ c, ∃ τ : ℝ, 0 < τ ∧
          (x : Phase) 0 = 0 ∧ (x : Phase) 3 = 0 ∧ (x : Phase) 1 ≠ 0 ∧
          (∀ u ∈ Set.Ioo 0 τ,
            relativePosition μ ((φ u x : LeftEnergyState μ c) : Phase) 1 < 0) ∧
          StrictMonoOn
            (fun u : ℝ => relativePosition μ ((φ u x : LeftEnergyState μ c) : Phase) 0)
            (Set.Icc 0 τ) ∧
          relativePosition μ ((φ τ x : LeftEnergyState μ c) : Phase) 0 = 0 ∧
          0 < jacobiVelocity
            (leviCivitaToJacobi μ ((φ τ x : LeftEnergyState μ c) : Phase)) 0 ∧
          shootingCoordinates μ ((φ τ x : LeftEnergyState μ c) : Phase) = Γ t := by sorry

end BirkhoffGlobalSection
