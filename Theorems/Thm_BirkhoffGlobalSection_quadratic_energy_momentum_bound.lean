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

import Mathlib.Data.Real.Basic
import Mathlib.Tactic.Linarith

namespace BirkhoffGlobalSection
theorem quadratic_energy_momentum_bound (K A B C p q : ℝ)
    (hK : 0 ≤ K) (hA : |A| ≤ K) (hB : |B| ≤ K) (hC : -K ≤ C)
    (henergy : (p ^ 2 + q ^ 2) / 2 + A * p + B * q + C ≤ 0) :
    |p| ≤ 4 * (K + 1) ∧ |q| ≤ 4 * (K + 1) := by sorry
end BirkhoffGlobalSection
