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
