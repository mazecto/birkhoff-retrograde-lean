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

noncomputable section

/-- The Jacobi (rotating-frame) velocity `q̇ = (p₁ - q₂, p₂ + q₁)` of a Jacobi
state `(q₁, q₂, p₁, p₂)`, i.e. `∂H/∂p` for the Jacobi Hamiltonian. -/
def jacobiVelocity (s : Phase) : Plane :=
  ![s 2 - s 1, s 3 + s 0]

/-- Birkhoff's shooting coordinates of a Levi-Civita state: the sine of the
angle that the physical velocity makes with the `q₁`-direction, and the depth
of the physical position below the axis of the primaries. -/
def shootingCoordinates (μ : ℝ) (s : Phase) : ℝ × ℝ :=
  (jacobiVelocity (leviCivitaToJacobi μ s) 1 /
      Real.sqrt (jacobiVelocity (leviCivitaToJacobi μ s) 0 ^ 2 +
        jacobiVelocity (leviCivitaToJacobi μ s) 1 ^ 2),
    -relativePosition μ s 1)

end

end BirkhoffGlobalSection
