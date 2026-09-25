import Mathlib.Topology.ContinuousOn
import Mathlib.Order.Interval.Set.Basic
import Mathlib.Data.Real.Basic
import Mathlib.Topology.Instances.Real.Lemmas

namespace PlanarTopology

theorem crossing_paths_in_square (f g : ℝ → ℝ × ℝ)
    (hf : ContinuousOn f (Set.Icc (-1) 1)) (hg : ContinuousOn g (Set.Icc (-1) 1))
    (hfK : ∀ s ∈ Set.Icc (-1 : ℝ) 1, |(f s).1| ≤ 1 ∧ |(f s).2| ≤ 1)
    (hgK : ∀ t ∈ Set.Icc (-1 : ℝ) 1, |(g t).1| ≤ 1 ∧ |(g t).2| ≤ 1)
    (hf₀ : (f (-1)).1 = -1) (hf₁ : (f 1).1 = 1)
    (hg₀ : (g (-1)).2 = -1) (hg₁ : (g 1).2 = 1) :
    ∃ s ∈ Set.Icc (-1 : ℝ) 1, ∃ t ∈ Set.Icc (-1 : ℝ) 1, f s = g t := by sorry

end PlanarTopology
