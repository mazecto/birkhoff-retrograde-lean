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

import Theorems.Thm_BirkhoffGlobalSection_inner_collinear_force_polynomial_root
import Theorems.Thm_BirkhoffGlobalSection_inner_collinear_polynomial_root_is_equilibrium

open BirkhoffGlobalSection

theorem solution (μ : ℝ) (hμ0 : 0 < μ) (hμ1 : μ < 1) :
    ∃ L : Phase, IsInnerLagrangePoint μ L := by
  rcases inner_collinear_force_polynomial_root μ hμ0 hμ1 with
    ⟨x, hxlo, hxhi, hpoly⟩
  exact ⟨![x, 0, 0, -x],
    inner_collinear_polynomial_root_is_equilibrium μ hμ0 hμ1 x hxlo hxhi hpoly⟩
