# Birkhoff's retrograde orbit — a Lean 4 formalization in progress

This repository collects a machine-checked (Lean 4 + Mathlib) development toward
**Birkhoff's retrograde periodic orbit** in the planar circular restricted three-body problem,
following G. D. Birkhoff, *The restricted problem of three bodies* (Rend. Circ. Mat. Palermo 39, 1915, §§16–18)
and the modern account in Liu–Salomão, *Finite energy foliations in the restricted three-body problem*
([arXiv:2506.17867](https://arxiv.org/abs/2506.17867), §5).

It was developed on the [Prove2Me](https://prove2.me) platform as part of the mission
*Birkhoff's Retrograde Global-Section Conjecture*. See [`STATUS.md`](STATUS.md) for the
theorem-by-theorem status.

## What is proved

Working in Levi-Civita regularized coordinates on the energy component around the primary of mass `1 − μ`,
for `0 < μ < 1` and energies below the first critical value:

- **Geometry of the energy component** — compactness, regularity, radial structure, the Hill-region
  bounds, the inner Lagrange point and the first critical value.
- **Symmetries of the flow** — antipodal equivariance and the `q₂`-reflection reversibility.
- **Existence of Birkhoff's retrograde periodic orbit** (`birkhoff_retrograde_orbit_exists`), obtained from
  Birkhoff's shooting lemma (a symmetric half-orbit) by a fully proved winding/closing argument.
- **Birkhoff's two-family shooting lemma** (`birkhoff_shooting_symmetric_half_orbit`), proved completely:
  - the planar crossing lemmas (`PlanarTopology.crossing_paths_in_square`,
    `interlaced_arcs_in_rectangle`), derived from Brouwer's fixed point theorem without the Jordan curve theorem;
  - the near-side monotonicity `d/dt (v₁ + 2x₂) = Ω_{x₁} < 0`;
  - **continuity of the first crossing** for both families (persistence of transversal crossings);
  - **the collision limits** `σ → ±√2/2` for starts close to the primary (near-linear flow estimates);
  - **compactness at the first failing parameter** for both families. On the far side this follows
    Birkhoff 1915 §18: his identity (59) (the torque identity for `L = x v₂ − y v₁`) and his third-derivative
    argument exclude an interior zero of `v₁`;
  - **the end of the far family.** Birkhoff does not treat the case where the far family ends at rest on the
    line through the primary. The `…_rest` lemmas allow it. The energy relation `|v|² = 2(Ω − c)` and the strict
    decrease of `Ω` along that line inside the inner Lagrange disk show that every moving crossing state lies
    strictly above the rest state. The near curve then cannot reach the top edge of Birkhoff's rectangle, and
    the interlaced-arcs lemma applies to a truncated far curve.

## What is still open

Birkhoff's retrograde orbit and the shooting lemma are **Proved**. Still open in the mission:

- the global-section statements `birkhoff_retrograde_global_section`, `near_equal_mass_birkhoff_rational_global_section`
  and `away_from_equal_mass_retrograde_global_section`;
- some alternative, stronger lemmas that the proof no longer needs:
  - the strict near end `birkhoff_near_arc_end`;
  - Birkhoff-type far-end statements without the rest case (`birkhoff_far_arc_end`, `birkhoff_far_arc_limit`, …);
  - the two leaves that would exclude the rest end directly (`birkhoff_far_no_rest_end`,
    `birkhoff_far_arc_velocity_bound`).

See `STATUS.md` for the full list.

## Layout

| Directory | Contents |
|---|---|
| `Definitions/` | Shared definitions (`Def_*.lean`), identical to the platform definition files. |
| `Theorems/` | Statements of every theorem used, stubbed with `sorry` (the platform's statement files). |
| `Proofs/` | Accepted proofs. Each file proves `theorem solution` with **exactly** the type of the corresponding statement, importing only statement stubs, so it is checked against the interface rather than against other proofs. |

A proof file that imports a statement which is open (see `STATUS.md`) is a *reduction*: it is fully checked,
and the open statements are its remaining obligations.

## Building

```bash
lake exe cache get   # download the Mathlib cache
lake build           # builds Definitions, Theorems (with sorry warnings) and all Proofs
```

Toolchain and Mathlib revision are pinned (`lean-toolchain`, `lakefile.lean`, `lake-manifest.json`):
Lean v4.33.1, Mathlib `0df444a360eaa60ab8c11dca51a86af692955474`.

To check that a given proof depends on no unproved statement, trace its imports through `STATUS.md`
(every import is a `Theorems/` stub; a stub is justified exactly when its platform status is *Proved*).

## Attribution

Most statements and all proofs in `Proofs/` were written on the author's Prove2Me account (Mazecto).
Some statements and definitions come from other Prove2Me users and are included so the proofs build:

- **Yivy Yu** — `Definitions/Def_BirkhoffGlobalSection.lean` and the mission's top-level statements
  (`birkhoff_retrograde_global_section`, `birkhoff_retrograde_orbit_exists`, `antipodal_symmetry`,
  `left_energy_component_geometry`, `leftCollisionPoint_mem_leftEnergyComponent`,
  `leviCivita_smoothAt_of_secondCollisionFree`, `near_equal_mass_birkhoff_rational_global_section`).
- **korbonits** — `Definitions/Def_Hatcher_Circle.lean` and the statement `Hatcher.brouwer_fixed_point_disk`
  (after Hatcher, *Algebraic Topology*, Thm 1.9).

Only statements of third-party theorems are included, not their proofs.

## License

Copyright 2026 Dhia Eddine Ramdani. Licensed under the Apache License 2.0 (see `LICENSE`), the same license as Mathlib.
Each file written for this project carries the Apache boilerplate notice in its header; the third-party
statements and definitions listed above do not, and remain credited to their authors.
