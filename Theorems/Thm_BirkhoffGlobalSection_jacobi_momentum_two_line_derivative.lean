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

/-- Along the second momentum coordinate line, the potential is constant and
the Jacobi Hamiltonian is quadratic in that coordinate. -/
theorem jacobi_momentum_two_line_derivative (μ : ℝ) (s : Phase) :
    HasDerivAt
      (fun t : ℝ => jacobiHamiltonian μ (Function.update s (3 : Fin 4) t))
      (s 3 + s 0) (s 3) := by sorry

end BirkhoffGlobalSection
