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

import Lake
open Lake DSL

package «birkhoff_retrograde» where
  leanOptions := #[⟨`autoImplicit, false⟩]

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @
  "0df444a360eaa60ab8c11dca51a86af692955474"

/-- Shared definitions (platform `Definitions.Def_*` modules). -/
lean_lib «Definitions» where
  globs := #[.submodules `Definitions]

/-- Statements of the mission theorems (platform `Theorems.Thm_*` modules, `sorry`-stubbed). -/
lean_lib «Theorems» where
  globs := #[.submodules `Theorems]

/-- Accepted proofs and reductions, each checked against the statement stubs. -/
@[default_target]
lean_lib «Proofs» where
  globs := #[.submodules `Proofs]
