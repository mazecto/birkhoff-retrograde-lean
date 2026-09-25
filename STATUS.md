# Status

Snapshot of the Prove2Me mission *Birkhoff's Retrograde Global-Section Conjecture* (plus the planar-topology crossing lemmas it uses), taken 2026-09-25.

- Statements tracked: **124** — Proved on the platform: **113**, Open: **11**.
- Proof files in this repo: **109** complete proofs and **7** accepted reductions (sketches).

*Proof* = checked proof importing only proved statements. *Reduction* = checked proof that imports open statements (the open statements are its remaining children). *Statement only* = the statement is used here but no proof of it is included.

| Theorem | Platform status | In this repo | File |
|---|---|---|---|
| `BirkhoffGlobalSection.antipodal_symmetry` | Proved | statement only | — |
| `BirkhoffGlobalSection.away_from_equal_mass_retrograde_global_section` | Open | statement only | — |
| `BirkhoffGlobalSection.birkhoff_far_arc_continuity` | Proved | proof | `Proofs/BirkhoffGlobalSection_birkhoff_far_arc_continuity.lean` |
| `BirkhoffGlobalSection.birkhoff_far_arc_end` | Open | statement only | — |
| `BirkhoffGlobalSection.birkhoff_far_arc_small` | Proved | proof | `Proofs/BirkhoffGlobalSection_birkhoff_far_arc_small.lean` |
| `BirkhoffGlobalSection.birkhoff_far_crossing_curve` | Open | reduction (sketch) | `Proofs/BirkhoffGlobalSection_birkhoff_far_crossing_curve.lean` |
| `BirkhoffGlobalSection.birkhoff_far_shooting_family` | Open | reduction (sketch) | `Proofs/BirkhoffGlobalSection_birkhoff_far_shooting_family.lean` |
| `BirkhoffGlobalSection.birkhoff_near_arc_continuity` | Proved | proof | `Proofs/BirkhoffGlobalSection_birkhoff_near_arc_continuity.lean` |
| `BirkhoffGlobalSection.birkhoff_near_arc_end` | Open | statement only | — |
| `BirkhoffGlobalSection.birkhoff_near_arc_small` | Proved | proof | `Proofs/BirkhoffGlobalSection_birkhoff_near_arc_small.lean` |
| `BirkhoffGlobalSection.birkhoff_near_crossing_curve` | Open | reduction (sketch) | `Proofs/BirkhoffGlobalSection_birkhoff_near_crossing_curve.lean` |
| `BirkhoffGlobalSection.birkhoff_near_quadrant_monotone` | Proved | proof | `Proofs/BirkhoffGlobalSection_birkhoff_near_quadrant_monotone.lean` |
| `BirkhoffGlobalSection.birkhoff_near_shooting_family` | Open | reduction (sketch) | `Proofs/BirkhoffGlobalSection_birkhoff_near_shooting_family.lean` |
| `BirkhoffGlobalSection.birkhoff_retrograde_global_section` | Open | reduction (sketch) | `Proofs/BirkhoffGlobalSection_birkhoff_retrograde_global_section.lean` |
| `BirkhoffGlobalSection.birkhoff_retrograde_orbit_exists` | Open | reduction (sketch) | `Proofs/BirkhoffGlobalSection_birkhoff_retrograde_orbit_exists.lean` |
| `BirkhoffGlobalSection.birkhoff_shooting_symmetric_half_orbit` | Open | reduction (sketch) | `Proofs/BirkhoffGlobalSection_birkhoff_shooting_symmetric_half_orbit.lean` |
| `BirkhoffGlobalSection.circle_reciprocal_distance_bound` | Proved | proof | `Proofs/BirkhoffGlobalSection_circle_reciprocal_distance_bound.lean` |
| `BirkhoffGlobalSection.compact_unique_fiber_selection_continuous` | Proved | proof | `Proofs/BirkhoffGlobalSection_compact_unique_fiber_selection_continuous.lean` |
| `BirkhoffGlobalSection.compact_unique_ray_graph_compact` | Proved | proof | `Proofs/BirkhoffGlobalSection_compact_unique_ray_graph_compact.lean` |
| `BirkhoffGlobalSection.compact_unique_ray_radial_graph` | Proved | proof | `Proofs/BirkhoffGlobalSection_compact_unique_ray_radial_graph.lean` |
| `BirkhoffGlobalSection.compact_unique_ray_radius_continuous` | Proved | proof | `Proofs/BirkhoffGlobalSection_compact_unique_ray_radius_continuous.lean` |
| `BirkhoffGlobalSection.first_ray_zero_in_left_negative_closure` | Proved | proof | `Proofs/BirkhoffGlobalSection_first_ray_zero_in_left_negative_closure.lean` |
| `BirkhoffGlobalSection.first_ray_zero_on_left_energy_component` | Proved | proof | `Proofs/BirkhoffGlobalSection_first_ray_zero_on_left_energy_component.lean` |
| `BirkhoffGlobalSection.inner_collinear_critical_position_unique` | Proved | proof | `Proofs/BirkhoffGlobalSection_inner_collinear_critical_position_unique.lean` |
| `BirkhoffGlobalSection.inner_collinear_force_polynomial_root` | Proved | proof | `Proofs/BirkhoffGlobalSection_inner_collinear_force_polynomial_root.lean` |
| `BirkhoffGlobalSection.inner_collinear_polynomial_root_is_equilibrium` | Proved | proof | `Proofs/BirkhoffGlobalSection_inner_collinear_polynomial_root_is_equilibrium.lean` |
| `BirkhoffGlobalSection.inner_lagrange_ball_radial_convexity` | Proved | proof | `Proofs/BirkhoffGlobalSection_inner_lagrange_ball_radial_convexity.lean` |
| `BirkhoffGlobalSection.inner_lagrange_ball_radial_force_negative` | Proved | proof | `Proofs/BirkhoffGlobalSection_inner_lagrange_ball_radial_force_negative.lean` |
| `BirkhoffGlobalSection.inner_lagrange_circle_effective_potential_bound` | Proved | proof | `Proofs/BirkhoffGlobalSection_inner_lagrange_circle_effective_potential_bound.lean` |
| `BirkhoffGlobalSection.inner_lagrange_circle_hamiltonian_lower_bound` | Proved | proof | `Proofs/BirkhoffGlobalSection_inner_lagrange_circle_hamiltonian_lower_bound.lean` |
| `BirkhoffGlobalSection.inner_lagrange_disk_near_side_force_negative` | Proved | proof | `Proofs/BirkhoffGlobalSection_inner_lagrange_disk_near_side_force_negative.lean` |
| `BirkhoffGlobalSection.inner_lagrange_disk_vertical_tidal_factor` | Proved | proof | `Proofs/BirkhoffGlobalSection_inner_lagrange_disk_vertical_tidal_factor.lean` |
| `BirkhoffGlobalSection.inner_lagrange_le_collinear_critical_energy` | Proved | proof | `Proofs/BirkhoffGlobalSection_inner_lagrange_le_collinear_critical_energy.lean` |
| `BirkhoffGlobalSection.inner_lagrange_le_left_outer_critical_energy` | Proved | proof | `Proofs/BirkhoffGlobalSection_inner_lagrange_le_left_outer_critical_energy.lean` |
| `BirkhoffGlobalSection.inner_lagrange_le_right_outer_critical_energy` | Proved | proof | `Proofs/BirkhoffGlobalSection_inner_lagrange_le_right_outer_critical_energy.lean` |
| `BirkhoffGlobalSection.inner_lagrange_le_triangular_energy` | Proved | proof | `Proofs/BirkhoffGlobalSection_inner_lagrange_le_triangular_energy.lean` |
| `BirkhoffGlobalSection.inner_lagrange_minimizes_critical_energy` | Proved | proof | `Proofs/BirkhoffGlobalSection_inner_lagrange_minimizes_critical_energy.lean` |
| `BirkhoffGlobalSection.inner_lagrange_point_exists` | Proved | proof | `Proofs/BirkhoffGlobalSection_inner_lagrange_point_exists.lean` |
| `BirkhoffGlobalSection.inner_lagrange_realizes_first_critical_value` | Proved | proof | `Proofs/BirkhoffGlobalSection_inner_lagrange_realizes_first_critical_value.lean` |
| `BirkhoffGlobalSection.inner_lagrange_subcritical_circle_energy_positive` | Proved | proof | `Proofs/BirkhoffGlobalSection_inner_lagrange_subcritical_circle_energy_positive.lean` |
| `BirkhoffGlobalSection.inner_lagrange_subcritical_circle_forbidden` | Proved | proof | `Proofs/BirkhoffGlobalSection_inner_lagrange_subcritical_circle_forbidden.lean` |
| `BirkhoffGlobalSection.inner_outer_reflection_potential` | Proved | proof | `Proofs/BirkhoffGlobalSection_inner_outer_reflection_potential.lean` |
| `BirkhoffGlobalSection.jacobi_collisionFree_differentiableAt` | Proved | proof | `Proofs/BirkhoffGlobalSection_jacobi_collisionFree_differentiableAt.lean` |
| `BirkhoffGlobalSection.jacobi_critical_momentum` | Proved | proof | `Proofs/BirkhoffGlobalSection_jacobi_critical_momentum.lean` |
| `BirkhoffGlobalSection.jacobi_momentum_two_line_derivative` | Proved | proof | `Proofs/BirkhoffGlobalSection_jacobi_momentum_two_line_derivative.lean` |
| `BirkhoffGlobalSection.jacobi_partial_momentum_one` | Proved | proof | `Proofs/BirkhoffGlobalSection_jacobi_partial_momentum_one.lean` |
| `BirkhoffGlobalSection.jacobi_partial_momentum_two` | Proved | proof | `Proofs/BirkhoffGlobalSection_jacobi_partial_momentum_two.lean` |
| `BirkhoffGlobalSection.jacobi_partial_position_one` | Proved | proof | `Proofs/BirkhoffGlobalSection_jacobi_partial_position_one.lean` |
| `BirkhoffGlobalSection.jacobi_partial_position_two` | Proved | proof | `Proofs/BirkhoffGlobalSection_jacobi_partial_position_two.lean` |
| `BirkhoffGlobalSection.jacobi_position_one_line_derivative` | Proved | proof | `Proofs/BirkhoffGlobalSection_jacobi_position_one_line_derivative.lean` |
| `BirkhoffGlobalSection.jacobi_position_two_line_derivative` | Proved | proof | `Proofs/BirkhoffGlobalSection_jacobi_position_two_line_derivative.lean` |
| `BirkhoffGlobalSection.leftCollisionPoint_mem_leftEnergyComponent` | Proved | statement only | — |
| `BirkhoffGlobalSection.left_collision_point_in_negative_boundary` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_collision_point_in_negative_boundary.lean` |
| `BirkhoffGlobalSection.left_component_closure_avoids_second_collision` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_component_closure_avoids_second_collision.lean` |
| `BirkhoffGlobalSection.left_component_closure_energy_zero` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_component_closure_energy_zero.lean` |
| `BirkhoffGlobalSection.left_component_jacobi_position_radius_bounded` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_component_jacobi_position_radius_bounded.lean` |
| `BirkhoffGlobalSection.left_component_momentum_coordinates_bounded` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_component_momentum_coordinates_bounded.lean` |
| `BirkhoffGlobalSection.left_component_position_coordinates_bounded` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_component_position_coordinates_bounded.lean` |
| `BirkhoffGlobalSection.left_component_position_radius_lt_one` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_component_position_radius_lt_one.lean` |
| `BirkhoffGlobalSection.left_component_radial_interior_negative` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_component_radial_interior_negative.lean` |
| `BirkhoffGlobalSection.left_component_radial_norm_positive` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_component_radial_norm_positive.lean` |
| `BirkhoffGlobalSection.left_component_radial_projection_continuous` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_component_radial_projection_continuous.lean` |
| `BirkhoffGlobalSection.left_component_ray_exists` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_component_ray_exists.lean` |
| `BirkhoffGlobalSection.left_component_ray_unique_scale` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_component_ray_unique_scale.lean` |
| `BirkhoffGlobalSection.left_component_second_collision_separated` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_component_second_collision_separated.lean` |
| `BirkhoffGlobalSection.left_component_unique_ray_intersection` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_component_unique_ray_intersection.lean` |
| `BirkhoffGlobalSection.left_energy_component_bounded` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_energy_component_bounded.lean` |
| `BirkhoffGlobalSection.left_energy_component_closed` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_energy_component_closed.lean` |
| `BirkhoffGlobalSection.left_energy_component_compact` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_energy_component_compact.lean` |
| `BirkhoffGlobalSection.left_energy_component_equivariant_sphere` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_energy_component_equivariant_sphere.lean` |
| `BirkhoffGlobalSection.left_energy_component_geometry` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_energy_component_geometry.lean` |
| `BirkhoffGlobalSection.left_energy_component_radial_bijection` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_energy_component_radial_bijection.lean` |
| `BirkhoffGlobalSection.left_energy_component_regular` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_energy_component_regular.lean` |
| `BirkhoffGlobalSection.left_first_radial_crossing_belongs_to_component` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_first_radial_crossing_belongs_to_component.lean` |
| `BirkhoffGlobalSection.left_negative_boundary_bounded` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_negative_boundary_bounded.lean` |
| `BirkhoffGlobalSection.left_negative_boundary_closed` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_negative_boundary_closed.lean` |
| `BirkhoffGlobalSection.left_negative_boundary_compact` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_negative_boundary_compact.lean` |
| `BirkhoffGlobalSection.left_negative_boundary_preconnected` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_negative_boundary_preconnected.lean` |
| `BirkhoffGlobalSection.left_negative_boundary_radial_graph` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_negative_boundary_radial_graph.lean` |
| `BirkhoffGlobalSection.left_negative_boundary_radial_interior_negative` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_negative_boundary_radial_interior_negative.lean` |
| `BirkhoffGlobalSection.left_negative_boundary_unique_positive_ray` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_negative_boundary_unique_positive_ray.lean` |
| `BirkhoffGlobalSection.left_negative_boundary_unique_ray_scale` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_negative_boundary_unique_ray_scale.lean` |
| `BirkhoffGlobalSection.left_negative_boundary_zero_in_energy_component` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_negative_boundary_zero_in_energy_component.lean` |
| `BirkhoffGlobalSection.left_negative_closure_avoids_second_collision` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_negative_closure_avoids_second_collision.lean` |
| `BirkhoffGlobalSection.left_negative_closure_bounded` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_negative_closure_bounded.lean` |
| `BirkhoffGlobalSection.left_negative_closure_momentum_coordinates_bounded` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_negative_closure_momentum_coordinates_bounded.lean` |
| `BirkhoffGlobalSection.left_negative_closure_no_interior_radial_zero` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_negative_closure_no_interior_radial_zero.lean` |
| `BirkhoffGlobalSection.left_negative_closure_nonpositive_energy` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_negative_closure_nonpositive_energy.lean` |
| `BirkhoffGlobalSection.left_negative_closure_position_coordinates_bounded` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_negative_closure_position_coordinates_bounded.lean` |
| `BirkhoffGlobalSection.left_negative_closure_position_radius_lt_one` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_negative_closure_position_radius_lt_one.lean` |
| `BirkhoffGlobalSection.left_negative_closure_radial_nonpositive` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_negative_closure_radial_nonpositive.lean` |
| `BirkhoffGlobalSection.left_negative_closure_radial_transversality` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_negative_closure_radial_transversality.lean` |
| `BirkhoffGlobalSection.left_negative_closure_strict_radial_star_shaped` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_negative_closure_strict_radial_star_shaped.lean` |
| `BirkhoffGlobalSection.left_negative_closure_uniform_collision_gap` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_negative_closure_uniform_collision_gap.lean` |
| `BirkhoffGlobalSection.left_ray_positive_energy_before_second_collision` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_ray_positive_energy_before_second_collision.lean` |
| `BirkhoffGlobalSection.left_subcritical_hill_circle_barrier` | Proved | proof | `Proofs/BirkhoffGlobalSection_left_subcritical_hill_circle_barrier.lean` |
| `BirkhoffGlobalSection.leviCivita_flow_antipodally_equivariant` | Proved | proof | `Proofs/BirkhoffGlobalSection_leviCivita_flow_antipodally_equivariant.lean` |
| `BirkhoffGlobalSection.leviCivita_flow_q2_reversible` | Proved | proof | `Proofs/BirkhoffGlobalSection_leviCivita_flow_q2_reversible.lean` |
| `BirkhoffGlobalSection.leviCivita_regularAt_collisionFree_subcritical_energy` | Proved | proof | `Proofs/BirkhoffGlobalSection_leviCivita_regularAt_collisionFree_subcritical_energy.lean` |
| `BirkhoffGlobalSection.leviCivita_regularAt_left_collision` | Proved | proof | `Proofs/BirkhoffGlobalSection_leviCivita_regularAt_left_collision.lean` |
| `BirkhoffGlobalSection.leviCivita_smoothAt_of_secondCollisionFree` | Proved | statement only | — |
| `BirkhoffGlobalSection.leviCivita_zero_offset_square_lower_bound` | Proved | proof | `Proofs/BirkhoffGlobalSection_leviCivita_zero_offset_square_lower_bound.lean` |
| `BirkhoffGlobalSection.near_equal_mass_birkhoff_rational_global_section` | Open | statement only | — |
| `BirkhoffGlobalSection.noncollinear_critical_energy_value` | Proved | proof | `Proofs/BirkhoffGlobalSection_noncollinear_critical_energy_value.lean` |
| `BirkhoffGlobalSection.noncollinear_critical_equal_primary_distances` | Proved | proof | `Proofs/BirkhoffGlobalSection_noncollinear_critical_equal_primary_distances.lean` |
| `BirkhoffGlobalSection.noncollinear_critical_unit_distances` | Proved | proof | `Proofs/BirkhoffGlobalSection_noncollinear_critical_unit_distances.lean` |
| `BirkhoffGlobalSection.noncollinear_critical_vertical_balance` | Proved | proof | `Proofs/BirkhoffGlobalSection_noncollinear_critical_vertical_balance.lean` |
| `BirkhoffGlobalSection.nonpositive_regular_energy_momentum_bound` | Proved | proof | `Proofs/BirkhoffGlobalSection_nonpositive_regular_energy_momentum_bound.lean` |
| `BirkhoffGlobalSection.nonvertical_ray_reaches_inner_circle` | Proved | proof | `Proofs/BirkhoffGlobalSection_nonvertical_ray_reaches_inner_circle.lean` |
| `BirkhoffGlobalSection.outer_inverse_distance_potential_min` | Proved | proof | `Proofs/BirkhoffGlobalSection_outer_inverse_distance_potential_min.lean` |
| `BirkhoffGlobalSection.partial_derivative_eq_update_deriv` | Proved | proof | `Proofs/BirkhoffGlobalSection_partial_derivative_eq_update_deriv.lean` |
| `BirkhoffGlobalSection.phase_polar_homeomorph` | Proved | proof | `Proofs/BirkhoffGlobalSection_phase_polar_homeomorph.lean` |
| `BirkhoffGlobalSection.quadratic_energy_coordinate_bound` | Proved | proof | `Proofs/BirkhoffGlobalSection_quadratic_energy_coordinate_bound.lean` |
| `BirkhoffGlobalSection.quadratic_energy_momentum_bound` | Proved | proof | `Proofs/BirkhoffGlobalSection_quadratic_energy_momentum_bound.lean` |
| `BirkhoffGlobalSection.regular_energy_coefficients_bounded_on_box` | Proved | proof | `Proofs/BirkhoffGlobalSection_regular_energy_coefficients_bounded_on_box.lean` |
| `BirkhoffGlobalSection.regular_energy_momentum_bound_from_coordinate_bounds` | Proved | proof | `Proofs/BirkhoffGlobalSection_regular_energy_momentum_bound_from_coordinate_bounds.lean` |
| `BirkhoffGlobalSection.regularized_ray_energy_continuous_on_segment` | Proved | proof | `Proofs/BirkhoffGlobalSection_regularized_ray_energy_continuous_on_segment.lean` |
| `BirkhoffGlobalSection.regularized_ray_first_zero_exists` | Proved | proof | `Proofs/BirkhoffGlobalSection_regularized_ray_first_zero_exists.lean` |
| `BirkhoffGlobalSection.symmetric_half_loop_polar_winding` | Proved | proof | `Proofs/BirkhoffGlobalSection_symmetric_half_loop_polar_winding.lean` |
| `BirkhoffGlobalSection.unique_ray_radial_cover` | Proved | proof | `Proofs/BirkhoffGlobalSection_unique_ray_radial_cover.lean` |
| `BirkhoffGlobalSection.unit_three_sphere_subtype_preconnected` | Proved | proof | `Proofs/BirkhoffGlobalSection_unit_three_sphere_subtype_preconnected.lean` |
| `Hatcher.brouwer_fixed_point_disk` | Proved | statement only | — |
| `PlanarTopology.crossing_paths_in_square` | Proved | proof | `Proofs/PlanarTopology_crossing_paths_in_square.lean` |
| `PlanarTopology.interlaced_arcs_in_rectangle` | Proved | proof | `Proofs/PlanarTopology_interlaced_arcs_in_rectangle.lean` |
