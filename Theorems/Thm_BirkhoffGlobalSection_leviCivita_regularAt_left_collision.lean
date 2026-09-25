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

/-- At the regularized left collision `z=0`, the zero-energy condition
forces nonzero `w`, so the Hamiltonian differential cannot vanish. -/
theorem leviCivita_regularAt_left_collision (μ c : ℝ)
    (hμ1 : μ < 1) (s : Phase)
    (hK : leviCivitaHamiltonian μ c s = 0)
    (hz : zNormSq s = 0) :
    fderiv ℝ (leviCivitaHamiltonian μ c) s ≠ 0 := by sorry

end BirkhoffGlobalSection
