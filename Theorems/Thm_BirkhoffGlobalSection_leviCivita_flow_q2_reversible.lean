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

theorem leviCivita_flow_q2_reversible (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c)
    (φ : Flow ℝ (LeftEnergyState μ c))
    (hφ : IsLeviCivitaHamiltonianFlow μ c φ) :
    ∀ t : ℝ, ∀ s₁ s₂ : LeftEnergyState μ c,
      (s₂ : Phase) = jacobiQ₂Reflection (s₁ : Phase) →
        ((φ (-t) s₂ : LeftEnergyState μ c) : Phase) =
          jacobiQ₂Reflection ((φ t s₁ : LeftEnergyState μ c) : Phase) := by sorry

end BirkhoffGlobalSection
