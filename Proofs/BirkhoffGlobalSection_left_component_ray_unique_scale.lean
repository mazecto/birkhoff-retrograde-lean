import Mathlib.Tactic.Linarith
import Theorems.Thm_BirkhoffGlobalSection_left_component_radial_interior_negative

open BirkhoffGlobalSection

theorem solution (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∀ x ∈ unitThreeSphere, ∀ r t : ℝ,
      0 < r → 0 < t →
      (fun i : Fin 4 => r * x i) ∈ leftEnergyComponent μ c →
      (fun i : Fin 4 => t * x i) ∈ leftEnergyComponent μ c →
      r = t := by
  intro x hx r t hr ht hsr hst
  rcases lt_trichotomy r t with hlt | heq | hgt
  · have hneg := left_component_radial_interior_negative μ c hμ0 hμ1 hc
      x hx t ht hst r hr hlt
    have hreg : (fun i : Fin 4 => r * x i) ∈ regularEnergyLocus μ c :=
      connectedComponentIn_subset (regularEnergyLocus μ c)
        (leftCollisionPoint μ) hsr
    have hzero : leviCivitaHamiltonian μ c (fun i : Fin 4 => r * x i) = 0 := hreg.1
    linarith
  · exact heq
  · have hneg := left_component_radial_interior_negative μ c hμ0 hμ1 hc
      x hx r hr hsr t ht hgt
    have hreg : (fun i : Fin 4 => t * x i) ∈ regularEnergyLocus μ c :=
      connectedComponentIn_subset (regularEnergyLocus μ c)
        (leftCollisionPoint μ) hst
    have hzero : leviCivitaHamiltonian μ c (fun i : Fin 4 => t * x i) = 0 := hreg.1
    linarith
