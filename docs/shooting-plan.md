# Birkhoff shooting lemma — research notes and plan

Target: `BirkhoffGlobalSection.birkhoff_shooting_symmetric_half_orbit`, a child of milestone "Theorem 5.1".
- **SKETCH_ACCEPTED on 2026-09-25** (submission 425fa83b…).
- It now reduces to the two family lemmas below, together with `interlaced_arcs_in_rectangle` (proved) and `leviCivita_flow_antipodally_equivariant` (proved).
- Local file: Solutions/Sol_shooting.lean. The shooting-state matching algebra is fully proved inside it.

## New platform items (2026-09-25)
- Definition `BirkhoffShootingCoordinates` gives `jacobiVelocity s = (s2 − s1, s3 + s0)` and `shootingCoordinates μ s = (σ, η) = (v2/|v|, −x_rel,2)`.
- OPEN `birkhoff_near_shooting_family` (theorem id 6ab47345…) asserts a continuous Γ on [−1,1] in [−1,1]×[0,1] with these properties:
  - Γ(−1) = (α, 0) with −1 < α < −√2/2, and Γ(1) = (√2/2, 0).
  - Interior points have |σ| < 1 and η > 0.
  - Each interior point is realized by a backward trajectory from a near-side perpendicular start {z2 = w1 = 0, z1 ≠ 0}: it stays in the lower half-plane, x_rel increases strictly in forward time, v1 > 0 at the crossing, and it crosses at x_rel = 0 with coordinates Γ(λ).
- OPEN `birkhoff_far_shooting_family` (theorem id 1afa9034…) asserts a continuous Γ' from (−√2/2, 0) with these properties:
  - It ends either on a side σ = ±1 with η > 0, or on the bottom with σ > √2/2.
  - Interior points have η > 0.
  - Each interior point is realized by a forward trajectory from a far-side start {z1 = w3 = 0, z2 ≠ 0}, with the analogous properties.

## Family lemmas reduced (2026-09-25, second session)
- `birkhoff_near_shooting_family` is SKETCH_ACCEPTED. Its children are:
  - OPEN `birkhoff_near_crossing_curve` (id a7380b8e…);
  - PROVED `birkhoff_near_quadrant_monotone` (id 18f1840c…, ACCEPTED).
- `birkhoff_far_shooting_family` is SKETCH_ACCEPTED. Its only child is OPEN `birkhoff_far_crossing_curve` (id 7b57b9d1…).
- Crossing-curve form: ∃ b, S(r), T(r) on (0,b) with continuous crossing coordinates F(r), limits at 0⁺ and b⁻, and per-r arc data.
  - The near version needs only the quadrant condition, since monotonicity and v1 > 0 come from the proved lemma.
  - The far version still carries the monotonicity and v1 > 0 conditions.
- Glue: packaging via extendFrom (`continuousOn_Icc_extendFrom_Ioo`), |σ| < 1 from v1 > 0, and η < 1 from `left_component_position_radius_lt_one`.
- Near quadrant proof (local file Solutions/Sol_near_quadrant.lean). It contains reusable machinery:
  - explicit Hamiltonian vector field of K (`K_hvf`);
  - flow-line coordinate derivatives;
  - d/dt 2(z1² − z2²) = 4P v1;
  - d/dt g = 4P Ω_x on K = 0, with g = (w1 z1 − w2 z2)/P + 4 z1 z2;
  - the component lies inside the open L1 disk (`component_in_L1_disk`).
- Next: decompose the two crossing-curve lemmas. Candidate pieces:
  - (i) continuity of the first transversal crossing under flow continuity;
  - (ii) small-r asymptotics σ → ±√2/2;
  - (iii) the collision end. Here σ_end = sin(ψ/2 − π/4), where ψ is the arrival direction of the limiting collision orbit, so −1 < α < −√2/2 ⇔ ψ ∈ (−π/2, 0);
  - (iv) the far-side monotonicity (Birkhoff's identity (59)).

## Crossing curves reduced (third session)
- New definition `BirkhoffShootingArcs`:
  - `nearShootingStart` and `farShootingStart`: explicit perpendicular starts at z = (r, 0) and z = (0, r) on K = 0, regular at r = 0; checked numerically that K = 0;
  - `IsNearShootingArc`: backward arc in the open quadrant {x > 0, y < 0}, ending at x = 0 with y < 0;
  - `IsFarShootingArc`: forward arc with y < 0 and v1 > 0 on (0, τ], ending at x = 0 with y < 0.
- `birkhoff_near_crossing_curve` and `birkhoff_far_crossing_curve` are both SKETCH_ACCEPTED. Glue: first-bad-parameter supremum; r = 1 is bad by the radius bound; S and T chosen by choice; arc lengths are unique. Children, all OPEN:
  - `birkhoff_{near,far}_arc_continuity`: good set open, crossing coordinates continuous (ids 5af71563…, 54cfc1a6…);
  - `birkhoff_{near,far}_arc_small`: (0, ε) good, limit (±√2/2, 0) (ids e81f1e50…, 0cf7b7bd…);
  - `birkhoff_{near,far}_arc_end`: behaviour at the first bad parameter (ids cbb29119…, 60a43527…).
- Far arcs include v1 > 0 on (0, τ], so the far good set stays open. Numerically checked: min v_x > 0 along all valid far arcs. On the far axis inside the Hill region Ω_x > 0, so ẍ(0) > 0.
- Next candidates:
  - (a) continuity lemmas: flow continuity on a compact time interval plus transversality at both ends; the near-side transversality is already available from the quadrant lemma;
  - (b) small-r lemmas: linearization of the Levi-Civita flow at the collision circle;
  - (c) end lemmas: the collision-direction analysis, and identity (59) on the far side.

## Continuity lemmas PROVED (fourth session)
- `birkhoff_near_arc_continuity` and `birkhoff_far_arc_continuity` are both ACCEPTED as full proofs, with no open imports.
- Local files: Solutions/Sol_near_cont.lean and Solutions/Sol_far_cont.lean, assembled from CM*.lean and Abstract.lean.
- Reusable pieces:
  - `transversal_crossing_persists`: an abstract persistence lemma for a transversal first crossing, proved with product boxes, the mean value theorem at the start, the tube lemma on the middle interval, and the intermediate value theorem plus monotonicity at the crossing;
  - derivatives along the flow: dx/dt = 4P·vx, dy/dt = 4P·vy, dvy/dt = 4P(2vx + Ω_y), dvx/dt = 4P(Ω_x − 2vy) on K = 0;
  - arcs cannot start from rest: near arcs have vy > 0 at the start, far arcs have vy < 0;
  - `far_axis_omega_x_pos`: Ω_x > 0 on the far axis inside the L1 disk, via the L1 force balance and 1/(1−d)² + 1/(1+d)² ≥ 2;
  - `omega_y_pos`: the tidal factor gives Ω_y > 0 below the axis;
  - start states: K = 0 whenever the radicand is ≥ 0; nearby starts stay on the component, by a connected segment in the locus.
- Remaining open: `birkhoff_{near,far}_arc_small` (limits ±√2/2 as the start tends to the primary) and `birkhoff_{near,far}_arc_end` (behaviour at the first bad parameter).

## Small-start lemmas PROVED (fifth session)
- `birkhoff_near_arc_small` and `birkhoff_far_arc_small` are both ACCEPTED as full proofs.
- Local files: Solutions/Sol_near_small2.lean and Solutions/Sol_far_small2.lean, trimmed to about 35 s compile time; built from CM8–CM12.
- Method: near-linear Levi-Civita flow near the collision.
  - Uniform vector-field bound M on the compact component (`vf_bound`).
  - First- and second-order mean value estimates (`flow_estimates`): |z(t) − z − w t| ≤ (Ms + 2(|z⊥| + Ms))s.
  - Quantitative core lemmas `core_near` and `core_far` with explicit smallness conditions H1–H5; the crossing is the zero of g = z1 + z2.
  - Explicit crossing-coordinate formulas `Gnear` and `Gfar`, with their limits at (0, 0, √(1−μ)) and (0, −√(1−μ), 0).
  - The collision circle lies on the component (`collision_circle_mem`), so N(0) and F(0) are on it.
- Remaining open: `birkhoff_near_arc_end` and `birkhoff_far_arc_end`. These are the analytic core. Plan:
  - (a) at the first bad parameter the crossings degenerate, with depth η → 0; argue by compactness plus the monotone quantities (v1 > −2y, and transversality of axis returns);
  - (b) the limiting orbit is a collision orbit; σ → f(arrival direction), with f computed from the linearised Levi-Civita flow at the collision circle;
  - (c) strictness: the arrival direction lies in the open quadrant. On the far side this needs Birkhoff's identity (59). A degenerate symmetric collision orbit must be excluded here.

## Numerical validation of the family statements
- Scanned μ ∈ {0.001 … 0.999} × 5 energies (scratchpad scan.py and endp.py).
- The near-family collision end σ ranges over −0.88 … −0.7075 (always < −√2/2). The far end ranges over +0.7075 … +0.88, or tangency.
- The margin over √2/2 becomes tiny in the deep, Kepler-like regime (μ → 1, large c). The strict inequalities must come from Birkhoff's §16–17 asymptotics, so they are the delicate part of the proofs.
- All interior realizations satisfied every clause (lower half-plane, monotone x, v1 > 0).

## Sources
- Birkhoff 1915, §§16–18, in the Collected Mathematical Papers Vol. 1, pp. 731–741.
- Liu–Salomão, arXiv 2506.17867v2, §5, pp. 30–31.
- Coordinate dictionary: x_ours = −x_Birkhoff.
- Our equations of motion: ẍ = −2ẏ + Ω_x and ÿ = 2ẋ + Ω_y.

## Ingredients already proved
- Vertical tidal factor: (1−μ)/r1³ + μ/r2³ > 1 on the L1 disk.
- Near-side force: Ω_x < 0.
- Crossing lemmas: `crossing_paths_in_square` and `interlaced_arcs_in_rectangle`.

## Remaining work (children of the two family lemmas)
1. Continuity of the first-hit time and point on the transversal x_rel = 0 (flow continuity plus the implicit function theorem).
2. Near family: monotonicity via d/dt(ẋ + 2y) = Ω_x < 0, and the fall off the Hill boundary.
3. Far family: the location of the Ω_x = 0 branch on the far side, and Birkhoff's identity (59).
4. Near-collision asymptotics: the limits σ → ±√2/2 as the start point tends to P, and the strict collision-end inequalities.
