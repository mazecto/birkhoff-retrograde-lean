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

import Mathlib.Analysis.Calculus.Deriv.Pi
import Mathlib.Analysis.Calculus.Deriv.Comp
import Definitions.Def_BirkhoffGlobalSection

open BirkhoffGlobalSection

theorem solution (F : Phase → ℝ) (s : Phase) (i : Fin 4)
    (hdiff : DifferentiableAt ℝ F s) :
    partialDerivative F s i =
      deriv (fun t : ℝ => F (Function.update s i t)) (s i) := by
  have hvec : Pi.single i (1 : ℝ) = coordinateVector i := by
    ext j
    by_cases h : j = i
    · subst j
      simp [Pi.single, coordinateVector]
    · simp [Pi.single, coordinateVector, h, Ne.symm h]
  have hcoord : HasDerivAt (Function.update s i) (coordinateVector i) (s i) := by
    simpa only [hvec] using hasDerivAt_update s i (s i)
  have hcomp := hdiff.hasFDerivAt.comp_hasDerivAt_of_eq (s i) hcoord (by
    ext j
    by_cases h : j = i
    · subst j
      simp [Function.update_apply]
    · simp [Function.update_apply, h, Ne.symm h])
  change HasDerivAt (fun t : ℝ => F (Function.update s i t))
    (fderiv ℝ F s (coordinateVector i)) (s i) at hcomp
  exact hcomp.deriv.symm
