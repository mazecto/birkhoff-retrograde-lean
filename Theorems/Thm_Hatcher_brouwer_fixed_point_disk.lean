import Definitions.Def_Hatcher_Circle
import Mathlib

open unitInterval Hatcher

namespace Hatcher
theorem brouwer_fixed_point_disk
    (h : C(Metric.closedBall (0 : EuclideanSpace ℝ (Fin 2)) 1,
          Metric.closedBall (0 : EuclideanSpace ℝ (Fin 2)) 1)) :
    ∃ x, h x = x := by sorry
end Hatcher
