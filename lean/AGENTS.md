# Lean conventions

Rules for writing Lean in this directory. Research-wide rules live in
[`../.agents/AGENTS.md`](../.agents/AGENTS.md). Existing `.lean` files
predate these rules, so apply them to new files and to the code and
comments you write or rewrite.

## Where code goes

- General theorems go into `Ramsey/theorems/`, one file per topic.
- Widely used definitions go into `Ramsey/defs/`, one file per vocabulary
  topic: `Ramsey/defs/RamseyGraph.lean` holds the core Ramsey graph and
  bound-predicate vocabulary, `Ramsey/defs/Transversals.lean` the pivot and
  transversal vocabulary. Open a new file there for a new topic instead of
  growing an existing one.
- Everything else goes into the directory of its branch, for example
  `Ramsey/d18/` for d18 material and `Ramsey/d20/` for d20 material.

A theorem or a definition is general, or widely used, only when several
branches really use it. Otherwise it stays with its branch.

## Enumeration completeness

- `Ramsey/defs/Completeness.lean` defines `Ramsey.Complete S P`: every graph
  of class `P` lies in the set `S`.
- `Complete` is the wiring for refuting existence of a `(5,5)`-Ramsey graph
  on 43 vertices. A cover splits the ambient class into branch classes, every
  branch supplies a `Complete` proof for its enumerated set, and empty
  enumeration sets refute their classes through
  `Complete.forall_not_of_eq_empty`.
- Branch modules state their completeness as `Complete`; do not inline ad hoc
  completeness statements.

## Visibility

- New files do not open a blanket `@[expose] public section`. That block
  publishes every unmarked declaration in the file.
- Use the most local visibility that applies. A declaration used only in
  its own file is `private`. A declaration that other modules may import
  directly stays unmarked. `public` is only for the intended interface of
  a module.
- On this toolchain `private` declarations stay hidden from importers
  even under `@[expose]`, and only `public` declarations are re-exported
  through `public import`.

## lemma and theorem

- Use `lemma` for simple support results. Reserve `theorem` for major
  statements: branch targets, mirrored claims and interface criteria.
- `lemma` is provided by Mathlib, not by the Lean prelude. A file with no
  Mathlib import must use `theorem`.

## Comments

- Each file has one comment at the very top, the `/-! ... -/` module
  docstring.
- Each declaration gets a one- or two-line comment directly above it,
  written as `/-- ... -/`.
- No other comments. Rare exceptions are allowed.
- Comments use simple grammar. No semicolons and no em-dashes. Rare
  exceptions are allowed.
- Always write numbers as digits, for example `18`, not `eighteen`, including
  docstrings and comments.

## Links to markdown

- A `.lean` file never links to or names a markdown file.
- Markdown files may link to and name `.lean` files.
