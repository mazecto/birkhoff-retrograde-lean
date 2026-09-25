import Theorems.Thm_BirkhoffGlobalSection_left_negative_boundary_closed
import Theorems.Thm_BirkhoffGlobalSection_left_negative_boundary_bounded
import Mathlib.Topology.MetricSpace.Bounded

open BirkhoffGlobalSection

theorem solution (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    IsCompact
      {s : Phase | s ∈ closure
        (connectedComponentIn
          {t : Phase | leviCivitaHamiltonian μ c t < 0 ∧
            0 < secondCollisionDistanceSq t}
          (fun _ : Fin 4 => (0 : ℝ))) ∧
        leviCivitaHamiltonian μ c s = 0 ∧
        0 < secondCollisionDistanceSq s} := by
  exact Metric.isCompact_iff_isClosed_bounded.mpr
    ⟨left_negative_boundary_closed μ c hμ0 hμ1 hc,
      left_negative_boundary_bounded μ c hμ0 hμ1 hc⟩
