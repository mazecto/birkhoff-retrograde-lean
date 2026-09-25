import Mathlib.Topology.MetricSpace.Bounded
import Theorems.Thm_BirkhoffGlobalSection_left_energy_component_closed
import Theorems.Thm_BirkhoffGlobalSection_left_energy_component_bounded

open BirkhoffGlobalSection

theorem solution (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    IsCompact (leftEnergyComponent μ c) := by
  exact Metric.isCompact_iff_isClosed_bounded.mpr
    ⟨left_energy_component_closed μ c hμ0 hμ1 hc,
      left_energy_component_bounded μ c hμ0 hμ1 hc⟩
