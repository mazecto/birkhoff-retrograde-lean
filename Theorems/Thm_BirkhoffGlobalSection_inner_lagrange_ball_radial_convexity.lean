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

theorem inner_lagrange_ball_radial_convexity (μ : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1) (L : Phase) (hL : IsInnerLagrangePoint μ L)
    (ρ κ : ℝ) (hρ0 : 0 < ρ) (hρd : ρ ≤ L 0 + μ)
    (hκ0 : -1 ≤ κ) (hκ1 : κ ≤ 1) :
    1 ≤ 1 + 2 * (1 - μ) / ρ ^ 3 +
      μ * (3 * (ρ - κ) ^ 2 - (ρ ^ 2 - 2 * ρ * κ + 1)) /
        Real.sqrt (ρ ^ 2 - 2 * ρ * κ + 1) ^ 5 := by sorry

end BirkhoffGlobalSection
