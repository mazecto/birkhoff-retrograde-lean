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

theorem birkhoff_shooting_symmetric_half_orbit (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c)
    (φ : Flow ℝ (LeftEnergyState μ c))
    (hφ : IsLeviCivitaHamiltonianFlow μ c φ) :
    ∃ x : LeftEnergyState μ c, ∃ τ : ℝ, 0 < τ ∧
      (x : Phase) 0 = 0 ∧ (x : Phase) 3 = 0 ∧ (x : Phase) 1 ≠ 0 ∧
      ((φ τ x : LeftEnergyState μ c) : Phase) 1 = 0 ∧
      ((φ τ x : LeftEnergyState μ c) : Phase) 2 = 0 ∧
      ((φ τ x : LeftEnergyState μ c) : Phase) 0 ≠ 0 ∧
      (∀ t ∈ Set.Ioo 0 τ,
        relativePosition μ ((φ t x : LeftEnergyState μ c) : Phase) 1 < 0) ∧
      StrictMonoOn
        (fun t : ℝ => relativePosition μ ((φ t x : LeftEnergyState μ c) : Phase) 0)
        (Set.Icc 0 τ) := by sorry

end BirkhoffGlobalSection
