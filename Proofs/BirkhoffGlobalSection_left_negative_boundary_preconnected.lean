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

import Theorems.Thm_BirkhoffGlobalSection_left_negative_boundary_radial_graph
import Theorems.Thm_BirkhoffGlobalSection_unit_three_sphere_subtype_preconnected
import Mathlib.Topology.Constructions

open BirkhoffGlobalSection

theorem solution (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    IsPreconnected
      {s : Phase | s ∈ closure
        (connectedComponentIn
          {t : Phase | leviCivitaHamiltonian μ c t < 0 ∧
            0 < secondCollisionDistanceSq t}
          (fun _ : Fin 4 => (0 : ℝ))) ∧
        leviCivitaHamiltonian μ c s = 0 ∧
        0 < secondCollisionDistanceSq s} := by
  obtain ⟨ρ, hρ, _, hboundary⟩ :=
    left_negative_boundary_radial_graph μ c hμ0 hμ1 hc
  let f : {x : Phase // x ∈ unitThreeSphere} → Phase :=
    fun x i => ρ x * (x : Phase) i
  have hf : Continuous f := by
    refine continuous_pi fun i => ?_
    exact hρ.mul ((continuous_apply i).comp continuous_subtype_val)
  have hconn : IsPreconnected (Set.range f) := by
    simpa only [Set.image_univ] using
      (unit_three_sphere_subtype_preconnected.image f hf.continuousOn)
  rw [hboundary]
  exact hconn
