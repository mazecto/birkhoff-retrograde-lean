import Definitions.Def_BirkhoffGlobalSection

namespace BirkhoffGlobalSection

theorem quadratic_energy_coordinate_bound
    (M A B K u v : ℝ) (hM : 0 ≤ M)
    (hA : |A| ≤ M) (hB : |B| ≤ M) (hK : |K| ≤ M)
    (henergy : (u ^ 2 + v ^ 2) / 2 + A * u + B * v + K = 0) :
    |u| ≤ 4 * M + 4 ∧ |v| ≤ 4 * M + 4 := by sorry

end BirkhoffGlobalSection
