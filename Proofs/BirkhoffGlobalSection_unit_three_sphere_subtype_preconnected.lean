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
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Analysis.Normed.Module.Connected
import Mathlib.Tactic

open BirkhoffGlobalSection

theorem solution :
    IsPreconnected
      (Set.univ : Set {x : Phase // x ∈ unitThreeSphere}) := by
  let E := EuclideanSpace ℝ (Fin 4)
  let e : E ≃L[ℝ] Phase := EuclideanSpace.equiv (Fin 4) ℝ
  have hcoords (s : Phase) :
      (∑ i : Fin 4, s i ^ 2) = zNormSq s + wNormSq s := by
    simp [Fin.sum_univ_succ, zNormSq, wNormSq] <;> ring
  have hmem (y : E) :
      y ∈ Metric.sphere (0 : E) 1 ↔ e y ∈ unitThreeSphere := by
    rw [EuclideanSpace.sphere_zero_eq (1 : ℝ) (by norm_num)]
    simp only [Set.mem_setOf_eq, one_pow]
    change (∑ i : Fin 4, (y i) ^ 2) = 1 ↔
      zNormSq (e y) + wNormSq (e y) = 1
    rw [hcoords]
    rfl
  have hset : e '' Metric.sphere (0 : E) 1 = unitThreeSphere := by
    ext s
    constructor
    · rintro ⟨y, hy, rfl⟩
      exact (hmem y).mp hy
    · intro hs
      refine ⟨e.symm s, (hmem (e.symm s)).mpr ?_, by simp⟩
      simpa using hs
  have hrank : 1 < Module.rank ℝ E := by
    rw [← Module.finrank_eq_rank]
    norm_num [E, finrank_euclideanSpace_fin]
  have hpre : IsPreconnected unitThreeSphere := by
    rw [← hset]
    exact (isPreconnected_sphere hrank (0 : E) (1 : ℝ)).image
      e e.continuous.continuousOn
  exact (isPreconnected_iff_preconnectedSpace.mp hpre).isPreconnected_univ
