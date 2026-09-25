import Definitions.Def_BirkhoffShootingCoordinates

namespace BirkhoffGlobalSection

noncomputable section

/-- The Levi-Civita state on the near half-axis `z = (r,0)` whose velocity is perpendicular
to the axis and points upward (`v₂ > 0`), normalized to the energy level `K = 0`:
`w = (0, √(2 r² (Ω - c)) - r (2r² - μ))`, written in a form regular at `r = 0`. -/
def nearShootingStart (μ c r : ℝ) : Phase :=
  ![r, 0, 0,
    Real.sqrt ((1 - μ) + r ^ 2 * ((2 * r ^ 2 - μ) ^ 2 + 2 * μ / |2 * r ^ 2 - 1| - 2 * c))
      - r * (2 * r ^ 2 - μ)]

/-- The Levi-Civita state on the far half-axis `z = (0,r)` whose velocity is perpendicular
to the axis and points downward (`v₂ < 0`), normalized to the energy level `K = 0`. -/
def farShootingStart (μ c r : ℝ) : Phase :=
  ![0, r,
    r * (2 * r ^ 2 + μ)
      - Real.sqrt ((1 - μ) + r ^ 2 * ((2 * r ^ 2 + μ) ^ 2 + 2 * μ / (1 + 2 * r ^ 2) - 2 * c)),
    0]

/-- A near shooting arc of backward length `τ`: going backward from `x`, the trajectory stays
in the open quadrant `{x₁ > 0, x₂ < 0}` and then reaches the vertical line `x₁ = 0`
strictly below the axis. -/
def IsNearShootingArc {μ c : ℝ} (φ : Flow ℝ (LeftEnergyState μ c))
    (x : LeftEnergyState μ c) (τ : ℝ) : Prop :=
  0 < τ ∧
  (∀ t ∈ Set.Ioo (-τ) 0,
    0 < relativePosition μ ((φ t x : LeftEnergyState μ c) : Phase) 0 ∧
    relativePosition μ ((φ t x : LeftEnergyState μ c) : Phase) 1 < 0) ∧
  relativePosition μ ((φ (-τ) x : LeftEnergyState μ c) : Phase) 1 < 0 ∧
  relativePosition μ ((φ (-τ) x : LeftEnergyState μ c) : Phase) 0 = 0

/-- A far shooting arc of length `τ`: going forward from `x`, the trajectory stays strictly
below the axis, moves with positive horizontal velocity after time `0`, and reaches the
vertical line `x₁ = 0` at time `τ`. -/
def IsFarShootingArc {μ c : ℝ} (φ : Flow ℝ (LeftEnergyState μ c))
    (x : LeftEnergyState μ c) (τ : ℝ) : Prop :=
  0 < τ ∧
  (∀ u ∈ Set.Ioo 0 τ,
    relativePosition μ ((φ u x : LeftEnergyState μ c) : Phase) 1 < 0) ∧
  relativePosition μ ((φ τ x : LeftEnergyState μ c) : Phase) 1 < 0 ∧
  relativePosition μ ((φ τ x : LeftEnergyState μ c) : Phase) 0 = 0 ∧
  ∀ u ∈ Set.Ioc 0 τ,
    0 < jacobiVelocity (leviCivitaToJacobi μ ((φ u x : LeftEnergyState μ c) : Phase)) 0

end

end BirkhoffGlobalSection
