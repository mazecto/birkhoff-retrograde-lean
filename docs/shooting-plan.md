# Birkhoff shooting lemma — research notes and plan

Target: `BirkhoffGlobalSection.birkhoff_shooting_symmetric_half_orbit`, a child of milestone "Theorem 5.1".
- **SKETCH_ACCEPTED on 2026-09-25** (submission 425fa83b…).
- A second sketch (submission 3ed901e1…, SKETCH_ACCEPTED) goes through the weak near family instead (see the sixth-session section).
- It reduces to the two family lemmas below, together with `interlaced_arcs_in_rectangle` (proved) and `leviCivita_flow_antipodally_equivariant` (proved).
- Local files: Solutions/Sol_shooting.lean and Sol_shooting_weak.lean. The shooting-state matching algebra is fully proved inside them.

## Status summary (end of eleventh session) — SHOOTING LEMMA PROVED
- `birkhoff_shooting_symmetric_half_orbit` is **Proved** on the platform (open leaves: none), via sketch v3 (submission 7a979cff…).
- Route: near side (fully proved) + the new "rest" chain on the far side, which bypasses both FV and `birkhoff_far_no_rest_end` (those stay open but are no longer needed).
- New platform theorems, all Proved on 2026-09-25:
  - `birkhoff_far_arc_limit_rest` (id 231a3bb3…): FA without the "v1 = 0 ⇒ v2 ≠ 0" clause. Full proof Sol_FA_rest.lean (≈50 s), submission c2474255….
  - `birkhoff_far_arc_end_rest` (id b27ffeda…): end E of Birkhoff type, or rest at depth d̄ with every moving state on the line strictly shallower. Sketch Sol_FAE_rest.lean.
  - `birkhoff_far_crossing_curve_rest` (id fd918dc6…), sketch Sol_FCC_rest.lean.
  - `birkhoff_far_shooting_family_rest` (id 3528dbb4…): Γ' on [−1,1) with the rest alternative (Γ'_2 → d). Sketch Sol_FF_rest.lean.
- Key new math (CM34): energy on the line |v|² = 2(Ω(0,−y) − c), Ω(0,−y) strictly decreasing inside the inner Lagrange disk (tidal factor), hence `hill_depth`.
- Shooting v3 (CM38): if Γ' ends at rest (depth d), the near curve has max depth m < d; cap Γ' at h = (m+d)/2, append the top-edge segment to (−1, h), and apply `interlaced_arcs_in_rectangle` in [−1,1]×[0,h]. This is Birkhoff's rectangle with top y0.
- Tooling: scratchpad `autoprune.py` (keeps declarations reachable from `solution`, drops unused Theorems imports) and `subst.py` (swap internal lemmas for platform theorems).

## Status summary (end of tenth session)
- Near side FULLY PROVED.
- `birkhoff_far_arc_limit` has two accepted reductions; either one suffices:
  - (a) via FV (`birkhoff_far_arc_velocity_bound`, g = v1 + 2y > 0 along arcs), submission f4dc3f79…;
  - (b) via Birkhoff §18: the only open child is `birkhoff_far_no_rest_end` (id 896fd6c7…; the far limit orbit does not arrive AT REST on the line X = 0), submission ef982218….
- So the weak route to the shooting lemma needs just one of FV or no-rest-end. Platform open leaves: those two plus the bypassed strict `birkhoff_near_arc_end`.
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

## Crossing curves reduced (third session)
- New definition `BirkhoffShootingArcs`:
  - `nearShootingStart` and `farShootingStart`: explicit perpendicular starts at z = (r, 0) and z = (0, r) on K = 0, regular at r = 0;
  - `IsNearShootingArc`: backward arc in the open quadrant {x > 0, y < 0}, ending at x = 0 with y < 0;
  - `IsFarShootingArc`: forward arc with y < 0 and v1 > 0 on (0, τ], ending at x = 0 with y < 0.
- `birkhoff_near_crossing_curve` and `birkhoff_far_crossing_curve` are both SKETCH_ACCEPTED. Glue: first-bad-parameter supremum; r = 1 is bad by the radius bound; S and T chosen by choice; arc lengths are unique. Children:
  - `birkhoff_{near,far}_arc_continuity` (ids 5af71563…, 54cfc1a6…) — PROVED;
  - `birkhoff_{near,far}_arc_small` (ids e81f1e50…, 0cf7b7bd…) — PROVED;
  - `birkhoff_{near,far}_arc_end` (ids cbb29119…, 60a43527…): the far one is now SKETCH_ACCEPTED, while the near (strict) one stays OPEN.
- Far arcs include v1 > 0 on (0, τ], so the far good set stays open. On the far axis inside the Hill region Ω_x > 0, so ẍ(0) > 0.

## Continuity lemmas PROVED (fourth session)
- `birkhoff_near_arc_continuity` and `birkhoff_far_arc_continuity` are both ACCEPTED as full proofs (Solutions/Sol_near_cont.lean and Sol_far_cont.lean).
- Reusable pieces:
  - `transversal_crossing_persists`: abstract persistence of a transversal first crossing;
  - derivatives along the flow: dx/dt = 4P·vx, dy/dt = 4P·vy, dvy/dt = 4P(2vx + Ω_y), dvx/dt = 4P(Ω_x − 2vy) on K = 0;
  - arcs cannot start from rest: near arcs have vy > 0 at the start, far arcs have vy < 0;
  - `far_axis_omega_x_pos`: Ω_x > 0 on the far axis inside the L1 disk;
  - `omega_y_pos`: Ω_y > 0 below the axis;
  - start states: K = 0 whenever the radicand is ≥ 0; nearby starts stay on the component.

## Small-start lemmas PROVED (fifth session)
- `birkhoff_near_arc_small` and `birkhoff_far_arc_small` are both ACCEPTED as full proofs (Solutions/Sol_near_small2.lean and Sol_far_small2.lean, about 35 s compile time).
- Method: near-linear Levi-Civita flow near the collision.
  - Uniform vector-field bound M on the compact component (`vf_bound`).
  - Mean value estimates (`flow_estimates`): |z(t) − z − w t| ≤ (Ms + 2(|z⊥| + Ms))s.
  - Core lemmas `core_near` and `core_far`; the crossing is the zero of g = z1 + z2.
  - Crossing-coordinate formulas `Gnear` and `Gfar`, with their limits.
  - The collision circle lies on the component (`collision_circle_mem`).

## End lemmas reduced (sixth session)
- New platform theorems (all published 2026-09-25):
  - PROVED `birkhoff_near_collision_strict` (dd1d5e4f…): if a backward near arc on (−T, 0) ends in a collision, then w1 > 0 > w2. Local file Solutions/Sol_near_strict_p.lean, about 55 s.
  - PROVED `birkhoff_far_collision_strict` (f5d9ba28…): if a forward arc with y < 0 and v1 > 0 on (0, T) ends in a collision, then w1 > 0 > w2. Local file Solutions/Sol_far_strict_p.lean.
  - OPEN `birkhoff_near_arc_degeneration` (ND, 8fda1a57…): at the first bad b there is N(b) with the quadrant condition on (−T, 0), a collision at −T, and τ(r) → T.
  - OPEN `birkhoff_far_arc_degeneration` (FD, 3d4a50e5…): at the first bad b there is F(b) with y < 0 and v1 > 0 on (0, T), x = 0 at T, and τ(r) → T. The end state is either a collision, or a tangency with y < 0, v1 = 0 and v2 ≠ 0.
  - Weak chain, all SKETCH_ACCEPTED:
    - `birkhoff_near_arc_end_weak` (12f59dc9…), with −1 ≤ α, from ND + NS;
    - `birkhoff_near_crossing_curve_weak` (131e6c55…);
    - `birkhoff_near_shooting_family_weak` (7b34e42c…).
- `birkhoff_far_arc_end` is SKETCH_ACCEPTED from FD + FS (Solutions/Sol_far_end.lean).
- Why weak: numerically, the vertical-ejection orbit can hit the axis perpendicularly for special (μ, c). That gives α = −1 (w2 = −w1), which local analysis cannot exclude. `interlaced_arcs_in_rectangle` only needs −1 ≤ α.
- New machinery (CM13–CM18):
  - collision estimates `coll_est_near`/`far` and `Vy_small_near`/`far`;
  - `coll_Vy_small`: v2 = O(|u|) at an axis-tangent collision;
  - strictness argument: v2 is monotone (dv2/dt = 4P(2v1 + Ω_y) > 0) and tends to 0 at the collision, which forces y to have the wrong sign;
  - `near_cross_state`/`far_cross_state`: the crossing state is z = (a, −a) or (−a, a);
  - `Gnear_collision_bounds`/`Gfar_collision_bound`;
  - `cont_coords'`: continuity of the coordinates using v2 ≠ 0;
  - `far_conv`: convergence via joint flow continuity.
- Assembly: scratchpad `assemble.py` concatenates CM modules into a single file; unneeded modules are then pruned for compile time.
- Remaining: ND and FD, the compactness/degeneration analysis at the first bad parameter. They need exclusion of:
  - an earlier return to the axis;
  - τ → ∞;
  - a zero-velocity stop;
  - on the near side, vertical tangency.

## Degenerations reduced to compactness (seventh session)
- PROVED (all ACCEPTED):
  - `birkhoff_near_boundary_exclusion` (d2d350da…): assume a backward orbit from a moving near start (v2 > 0) satisfies x ≥ 0, y ≤ 0 and z ≠ 0 on (−T, 0). Then it is in the open quadrant, or a shorter near arc exists. At a first contact with y = 0, v2 = 0 by the local maximum, but v2 is increasing afterwards. Local file Sol_nbe.lean (CM19), about 22 s.
  - `birkhoff_far_axis_exclusion` (77a31f59…): the far analog. With v1 > 0 on (0, T), the orbit cannot touch y = 0.
  - `birkhoff_near_limit_collision` (7fa8df3d…): if x = 0 and y ≤ 0 at −T and there is no near arc, then the orbit is in the open quadrant and the end is a collision.
  - `birkhoff_far_limit_end` (fe16ff95…): if there is no far arc, then y < 0 on (0, T), and the end is a collision or a vertical tangency.
- `birkhoff_near_arc_degeneration` (ND) and `birkhoff_far_arc_degeneration` (FD) are now SKETCH_ACCEPTED from:
  - OPEN `birkhoff_near_arc_limit` (NA, 388739e3…): v2(N(b)) > 0; closed signs and z ≠ 0 on (−T, 0); x = 0 and y ≤ 0 at −T; τ → T.
  - OPEN `birkhoff_far_arc_limit` (FA, e6e6c07b…): v2(F(b)) < 0; y ≤ 0, v1 > 0 and z ≠ 0 on (0, T); x = 0, y ≤ 0 and v1 ≥ 0 at T; v2 ≠ 0 at a tangency; τ → T.
- The weak route's only open leaves are now NA and FA.
- Content of NA: compactness (bounded τ and a limit orbit), no interior collision, and N(b) not at rest.
- FA additionally contains strict v1 > 0 on the open interval (Birkhoff identity (59)) and v2 ≠ 0 at a tangency.
- Numerical check of the NA/FA hypotheses (scratchpad check_limits.py; 9 values of μ from 0.001 to 0.999 × 5 energies; first bad b found by bisection to 40 steps). Every case is consistent:
  - start not at rest: b/M < 1 always (from 0.78 to 0.99999; closest to 1 for μ → 1 and deep energies);
  - both families end in a collision: η at the last good arc is between 1e-8 and 6e-6, and the next start gives a near-collision. No far tangency end occurred in the grid;
  - T converges (unchanged under a relative perturbation of 1e-6 in r); no approach to the primary over the first 90% of the arc;
  - far limit orbits: min v1 over [0.05T, T] is attained at 0.05T, so v1 increases along the arc and stays > 0;
  - σ at the near end lies in [−0.863, −0.7075]; α = −1 was not observed.

## Near compactness PROVED (eighth session)
- `birkhoff_near_arc_limit` ACCEPTED (submission 38e98225…). Single file Solutions/Sol_NA.lean, about 75 s; local files CM20–CM24.
- `near_no_infinite_stay` (CM20):
  - g = v1 + 2y decreases (the Ω_x < 0 lemma is `near_omega_x_neg`), so v1 ≥ κ > 0;
  - X bounded, together with a Lipschitz bound on |z|² (`z_coord_bound`), gives |z|² → 0;
  - `w_lower` (|w|² > (1−μ)/2 near z = 0, by compactness) plus `flow_estimates` then give a contradiction.
- Tools (CM21):
  - `comp_D_lower`;
  - `near_start_limit_mem`: 2b² < 1 and N(b) ∈ comp, via closedness;
  - `near_family`: S(r) = N(max(b/2, min(r, b))), continuous at b;
  - `tube_pos`: via `IsCompact.eventually_forall_of_forall_eventually`;
  - `limit_nonpos`;
  - `omega_y_nonneg`.
- `near_start_open` and `near_first_exit` (sSup of the quadrant times) are in CM22.
- `near_start_moving` (CM23): b < M, proved without numerics. At rest, arcs just below b force y ≤ 0 on (−t1, 0). But g > 0 gives v1 > 0, then v2 is increasing from 0, so y > 0: a contradiction.
- Assembly `near_arc_limit` (CM24):
  - the exit with X > 0 is excluded by the tube lemma plus limit plus `near_boundary_exclusion`;
  - at the collision exit, τ > S − h by the tube lemma, and τ ≤ S + h because z1 changes sign across the collision (w1 > 0 by NS) while arcs need z1 ≠ 0.
- Far analog still to do: FA needs the same machinery, plus strict v1 > 0 inside the limit orbit (Birkhoff (59)) and v2 ≠ 0 at a tangency.

## Far compactness reduced to FV (ninth session)
- `birkhoff_far_arc_limit` is SKETCH_ACCEPTED (submission f4dc3f79…). Its only open child is FV.
- Single file Solutions/Sol_FA3.lean, about 44 s locally. It imports the platform `birkhoff_far_collision_strict` instead of inlining CM13–16; a 90 s version timed out on the server's 300 s limit.
- Local files:
  - CM25: `far_start_limit_mem`, `far_family`, `far_start_open`;
  - CM26: `far_start_moving` (b < M, proved);
  - CM27: `Gpoly` = |z|²(v1 + 2y) and `far_no_infinite_stay`, an ω-limit argument (X → X∞, so a limit orbit has v1 ≡ 0; g ≥ 0 then gives y ≡ 0, contradicting Ω_x > 0 on the far axis);
  - CM28: the assembly `far_arc_limit`. It uses the first exit from {X < 0, Y < 0, v1 > 0}; the limit g ≥ 0 excludes an interior v1 = 0 and a tangency end; the sign flip of z2 (w2 < 0 by FS) bounds τ from above.
- About FV (Birkhoff (59)-type):
  - g = v1 + 2y satisfies dg/dt = Ω_x (physical time), with g(0) = 0 at the far start;
  - Ω_x = −X(τ_tidal − 1) − μ(1 − r2^−3), which is NEGATIVE on the line X = 0 off the axis (a cusp region). So FV is not a pointwise monotonicity;
  - also dQ/dt = μy(1 − r2^−3) < 0 for Q = L − r² (torque about the primary), and (v1 + 2y, v2 − 2X)' = ∇Ω;
  - numerically g ≥ 2.6|y| along all far arcs of the initial family (μ from 0.001 to 0.999, 15+12 energy settings); Ω_x < 0 only at the very end;
  - scripts: scratchpad far_mono.py, far_polar.py, far_g.py, far_A.py;
  - v1 itself is NOT monotone, the polar argument fails (ṙ > 0 near a pericentre), and A = |z|²(v1 + y) is not monotone.
- Local-min analysis for a possible proof of FV. At an interior zero of v1 we get Ω_x = 2v2 and v̈1 = Ω_xy·v2 − 2Ω_y, with Ω_xy > 0 and Ω_y > 0 in the far quadrant. So Ω_x ≤ 0 there gives a contradiction; the case Ω_x > 0 (v2 > 0, rising vertically) remains open.
- Birkhoff's original text is not available online here. Liu–Salomão only cite "the usual Birkhoff shooting method".

## Birkhoff §18 formalized (tenth session)
- The user supplied Birkhoff 1915 §§16–18 (pp. 731–742).
  - §17: the curve Ω_x = 0 is a closed loop through J, tangent there to the vertical line; rays from J cut it once (since yΩ_xy + (x−μ)Ω_xx > 0).
  - §18: uses the vertical line x = μ (same framework as ours). It proves dx/dt > 0 using g only inside the loop, then excludes an interior zero M of v1 by two arguments:
    - v2(M) ≤ 0: the third derivative x''' = 2Ω_y + Ω_xy·ẏ (a typo on p. 741 prints Ω_x);
    - v2(M) > 0: identity (59), the torque d/dt(L − r²) = μy(1 − r2^−3).
  - Ends: collision or tangency. A rest end is not discussed (the gap).
- New Lean (CM29–CM32):
  - `Lpoly` = L = 2(z1w2 − z2w1) − μX + X² + Y², a polynomial; `Lpoly_eq`, `torque_eq`, `torque_neg`, `L_hasDerivAt`, `L_deriv_neg`;
  - `far_arc_L_nonneg`: L ≥ 0 along every far arc (first-zero argument), so it passes to limits;
  - `om`, `omXY`, `om_hasDerivAt`, `omx_hasDerivAt` (chain rule for Ω_x where v1 = 0), `omXY_pos`;
  - `vx_no_touch_down` (Birkhoff's third-derivative lemma), `omx_on_line` (Ω_x < 0 on X = 0 off the axis), `omx_eq_of_vx_const`;
  - `far_no_infinite_stay2` (ω-limit with L ≥ 0);
  - `far_arc_X_neg`, `freq_limit_nonpos`, `far_tangency_upper` (τ → T at a tangency end);
  - `far_arc_limit2`, the assembly.
- Single file Solutions/Sol_FA_v2.lean, about 51 s locally.

## Numerical validation of the family statements
- Scanned μ ∈ {0.001 … 0.999} × 5 energies (scratchpad scan.py and endp.py).
- The near-family collision end σ ranges over −0.88 … −0.7075 (always < −√2/2). The far end ranges over +0.7075 … +0.88, or tangency.
- The margin over √2/2 becomes tiny in the deep, Kepler-like regime (μ → 1, large c).
- All interior realizations satisfied every clause (lower half-plane, monotone x, v1 > 0).

## Sources
- Birkhoff 1915, §§16–18, in the Collected Mathematical Papers Vol. 1, pp. 731–741.
- Liu–Salomão, arXiv 2506.17867v2, §5, pp. 30–31.
- Coordinate dictionary: x_ours = −x_Birkhoff.
- Our equations of motion: ẍ = −2ẏ + Ω_x and ÿ = 2ẋ + Ω_y.
