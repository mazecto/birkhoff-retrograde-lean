import Theorems.Thm_BirkhoffGlobalSection_left_negative_boundary_preconnected
import Theorems.Thm_BirkhoffGlobalSection_left_collision_point_in_negative_boundary

open BirkhoffGlobalSection

theorem solution (μ c : ℝ)
    (hμ0 : 0 < μ) (hμ1 : μ < 1)
    (hc : belowFirstCriticalValue μ c) :
    ∀ s ∈ closure
      (connectedComponentIn
        {t : Phase | leviCivitaHamiltonian μ c t < 0 ∧
          0 < secondCollisionDistanceSq t}
        (fun _ : Fin 4 => (0 : ℝ))),
      leviCivitaHamiltonian μ c s = 0 →
      0 < secondCollisionDistanceSq s →
      s ∈ leftEnergyComponent μ c := by
  let B : Set Phase :=
    {t | t ∈ closure
      (connectedComponentIn
        {u : Phase | leviCivitaHamiltonian μ c u < 0 ∧
          0 < secondCollisionDistanceSq u}
        (fun _ : Fin 4 => (0 : ℝ))) ∧
      leviCivitaHamiltonian μ c t = 0 ∧
      0 < secondCollisionDistanceSq t}
  have hconn : IsPreconnected B :=
    left_negative_boundary_preconnected μ c hμ0 hμ1 hc
  have hbase : leftCollisionPoint μ ∈ B :=
    left_collision_point_in_negative_boundary μ c hμ0 hμ1
  have hsubset : B ⊆ regularEnergyLocus μ c := by
    intro t ht
    exact ⟨ht.2.1, ht.2.2⟩
  intro s hclosure hzero hfree
  exact hconn.subset_connectedComponentIn hbase hsubset
    ⟨hclosure, hzero, hfree⟩
