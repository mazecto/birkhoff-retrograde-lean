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

/-- An equilibrium on the open interval between the primaries is the unique inner equilibrium. -/
theorem inner_collinear_critical_position_unique (μ : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) (L : Phase)
    (hL : IsInnerLagrangePoint μ L) (s : Phase)
    (hfree : collisionFree μ s)
    (hcrit : isCriticalPoint (jacobiHamiltonian μ) s)
    (haxis : s 1 = 0) (hleft : -μ < s 0) (hright : s 0 < 1 - μ) :
    s 0 = L 0 := by sorry

end BirkhoffGlobalSection
