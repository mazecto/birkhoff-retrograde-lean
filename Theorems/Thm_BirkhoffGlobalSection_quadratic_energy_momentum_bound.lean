import Mathlib.Data.Real.Basic
import Mathlib.Tactic.Linarith

namespace BirkhoffGlobalSection
theorem quadratic_energy_momentum_bound (K A B C p q : ℝ)
    (hK : 0 ≤ K) (hA : |A| ≤ K) (hB : |B| ≤ K) (hC : -K ≤ C)
    (henergy : (p ^ 2 + q ^ 2) / 2 + A * p + B * q + C ≤ 0) :
    |p| ≤ 4 * (K + 1) ∧ |q| ≤ 4 * (K + 1) := by sorry
end BirkhoffGlobalSection
