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
