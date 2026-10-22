# Lean conventions

Rules for writing Lean in this directory. Research-wide rules live in
[`../.agents/AGENTS.md`](../.agents/AGENTS.md). Existing `.lean` files
predate these rules, so apply them to new files and to the code and
comments you write or rewrite.

## Where code goes

- Standard mathematical background goes into `Ramsey/basics/`, one file per topic.
  `GraphTheory.lean`, `Transversals.lean` and `RamseyTheory.lean` hold elementary graph,
  hitting-set and Ramsey results. Reuse Mathlib before introducing a helper.
- Novel or non-standard generic theorems go into `Ramsey/theorems/`, one file per topic.
  `Ramsey/theorems/Counting.lean` also collects shared finite-graph counting arguments.
- Small repository-specific definitions go into `Ramsey/defs/`, one file per vocabulary
  topic. Standard transversal definitions belong with their background API in `basics/`.
  Open a new vocabulary file instead of growing an unrelated one.
- Everything else goes into the directory of its branch, for example
  `Ramsey/n43/d18/` for d18 material and `Ramsey/n43/d20/` for d20 material.

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

## lemma and theorem

- Every lemma and theorem is public by default.
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
