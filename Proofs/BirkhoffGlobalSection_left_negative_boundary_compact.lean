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
