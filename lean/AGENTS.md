# Lean conventions

Rules for writing Lean in this directory. Research-wide rules live in
[`../.agents/AGENTS.md`](../.agents/AGENTS.md). Existing `.lean` files
predate these rules, so apply them to new files and to comments you write
or rewrite.

## Where code goes

- General theorems go into `Ramsey/theorems/`, one file per topic.
- Widely used definitions go into `Ramsey/Defs.lean`.
- Everything else goes into the directory of its branch, for example
  `Ramsey/d18/` for d18 material and `Ramsey/d20/` for d20 material.

A theorem or a definition is general, or widely used, only when several
branches really use it. Otherwise it stays with its branch.

## Comments

- Each file has one comment at the very top, the `/-! ... -/` module
  docstring.
- Each declaration gets a one- or two-line comment directly above it,
  written as `/-- ... -/`.
- No other comments. Rare exceptions are allowed.
- Comments use simple grammar. No semicolons and no em-dashes. Rare
  exceptions are allowed.

## Links to markdown

- A `.lean` file never links to or names a markdown file.
- Markdown files may link to and name `.lean` files.
