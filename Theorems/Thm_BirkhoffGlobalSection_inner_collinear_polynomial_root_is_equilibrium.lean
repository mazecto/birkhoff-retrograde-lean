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

/-- A root of the collinear force equation gives a collision-free inner equilibrium. -/
theorem inner_collinear_polynomial_root_is_equilibrium (μ : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) (x : ℝ)
    (hxlo : -μ < x) (hxhi : x < 1 - μ)
    (hpoly : x * (x + μ) ^ 2 * (1 - μ - x) ^ 2 -
      (1 - μ) * (1 - μ - x) ^ 2 + μ * (x + μ) ^ 2 = 0) :
    IsInnerLagrangePoint μ (![x, 0, 0, -x] : Phase) := by sorry

end BirkhoffGlobalSection
