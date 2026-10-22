# Audit of unreviewed, unformalized symmetry claims

Date: 2026-10-19. Task: `audit-symmetry-quotients-20261019`.
Base HEAD: `3eebcca5e627fdc3df5f26fd2a1925a7c121153f` plus the uncommitted
working-tree state described below.

The user asked to pick unreviewed and unformalized claims and audit them.
The claim inventory at audit time showed seven claims that were all
`Review state: ready`, `Reviews: none`, none formalized in Lean, and none
owned by an active WORK task:

- [docs/general_theorems/symmetry_quotients.md](../../docs/general_theorems/symmetry_quotients.md)
  (4 claims), and
- [research/n43/d18/symmetry_extensions.md](../n43/d18/symmetry_extensions.md)
  (3 claims),

both authored by Codex in task `symmetry-extensions-20261015` with the
explicit handoff "seven claims ready with self-checks; independent review
pending". They were also the two files excluded from the
claim-state reconciliation as "no review exists; these remain the review
queue". `parameter_landscape.md` (5 ready) was skipped because the active
`parameter-landscape-audit-20261018` task owns it; draft design entries
(`catalogue_edge_maximality.md`, generator sections) and the ready
`x136_closure_consequences.md` / `tau` notes were left for separate audits.
Formalization status: no Lean module mirrors these claims; the theorem
catalogue listed them as pending review, not formalized.

## Method and identities

Author: Codex (task symmetry-extensions-20261015). Two independent reviewer
agents, both distinct from the author, rederived every proof step without
relying on the author's self-checks:

- `quotient_rigor` (agent QuotientRigor): the four symmetry_quotients
  claims; 95,626 scripted assertions, 0 failures, scratch checks outside
  the repository.
- `extension_rigor` (agent ExtensionRigor): the three symmetry_extensions
  claims; exhaustive partition, profile, 5-vertex graph and sorted-sequence
  checks, scratch checks outside the repository.

The coordinator independently re-derived all seven proofs and ran a third
verification script (33 checks, all PASS): exact factorial/kernel bounds and
full partition maximization; the five-vertex two-pair counterexample
(first difference at `02` for both single swaps, at `04` for the double
swap, double swap = orbit minimum); the greedy 2-CNF bit descent equal to
brute-force orbit minima on 300 random instances; the semidirect splitting,
unique factorization and `Can_Gamma` orbit identity on three concrete
occurrence instances including a genuinely nonidentity lift and a
nonfaithful occurrence action; the descent witness implying `gamma.z < z`
for every extension, exhaustively over S4 actions (32,524 instances); the
complement-selector equality profile (sums, baseline, budget, `D <lex D^c`)
for z=0..16; and the identities `3k-5q = q+3E` and
`W = 2e(B)-296+2q+2E` from `x = 136+2q+E`.

No solver, canonicalizer, automorphism procedure, graph search, catalogue
processing, download, installation, or Lean/engine change was used by the
author, the reviewers, or the coordinator. No novelty or literature review
was performed.

## Revisions reviewed

| Input | SHA-256 |
| --- | --- |
| docs/general_theorems/symmetry_quotients.md (reviewed) | `fa0bdb24eb7f746c81488d3eb56f37713122a926426e83888556ddc32edaa99f` |
| research/n43/d18/symmetry_extensions.md (reviewed) | `1f4115db83f8ac1b1f0f21a80213f9fef17076e3b43bfb3a76b3a76d06067497` |
| research/n43/d18/symmetry_reduction.md (dependency, accepted) | `6b9072c4a9b1f54042bd6d7e4913d4aedd5b0a8e8c04a2d18b994c2dc2d31d1b` |
| docs/general_theorems/signature_anchors.md (dependency, accepted) | `6d2c64d09b5dc3096b4948eef68e3cdbaa8b8d03edc68b88a41dd9113995175f` |

Both reviewed files were byte-identical to their HEAD blobs at review time
(the last commits touching them are `3eebcca5` for the tree and
`7ebbef26` for symmetry_extensions.md).

## Outcomes (quoted from the reviews)

- `#claim-symmetry-quotients-01`, `-02`, `-03`, `-04`: **accepted** —
  "No material statement/proof mismatch was found".
- `#claim-d18-symmetry-extensions-01`, `-02`, `-03`: **accepted** —
  "No material gap was found in any of the three claims; no premise
  outside any stated Scope was used."

Review records:
[review_symmetry_quotients_20261019_quotient_rigor.md](../../docs/general_theorems/review_symmetry_quotients_20261019_quotient_rigor.md)
(SHA-256 `1babf4c835e5a0ec9472b2465807cc9253f9c583af1b39e925bbf1485c536600`)
and
[review_symmetry_extensions_20261019_extension_rigor.md](../n43/d18/review_symmetry_extensions_20261019_extension_rigor.md)
(SHA-256 `8059e11c9ee9e18086a036f8b69aa745231ab0cf9a80b87c8594dc296bd1f485`).

The extension review's recorded dependency limit ("quotient Claims 01-02
ready, not accepted") is resolved by the parallel quotient review, which
accepted them at the same `fa0bdb24...` revision; both reviews state this
cross-reference.

## Findings recorded (editorial; no proof body changed)

- symmetry_quotients Claim 01: the setting's `Gamma` display does not bind
  `g in Aut(A)`; read over-wide the projection to `H` fails (the reviewer
  produced explicit counterexamples), while the conclusion and the source
  d18 claim force the intended reading. Recommended fix: add the binder.
- symmetry_quotients Claim 01: the proof should record the one-line fact
  that bijectivity of `tau` yields `m_(gC)=m_C`.
- symmetry_extensions Claim 01: the Conclusion sentence lists only the two
  internal ambient types; the `K_p`/`I_q` contradictions need the ambient
  `K_p/I_q`-free gluing, which the Scope supplies (the reviewer gave a
  standalone counterexample outside Scope). Recommended fix: name the
  ambient hypothesis in the Conclusion.
- Remaining findings are compressed-sub-step and dependency-citation notes
  (extension Claim 02's Dependencies omit symmetry Claim 01, carried
  transitively), all rederived correctly by the reviewers.

These wording fixes were deliberately not applied: acceptance attaches to
the exact reviewed revisions above. If the wording is later changed, the
file hash changes and the change must be recorded and rechecked.

## Integration record

Metadata-only integration, gated for byte preservation:

| File | Integrated SHA-256 | Gate |
| --- | --- | --- |
| docs/general_theorems/symmetry_quotients.md | `c5808fd81249f369388006a668f6cd7afa1e4bb5691f155abbea34522ec3e3dd` | strip banner + revert 4 state/4 review lines reproduces `fa0bdb24...` exactly |
| research/n43/d18/symmetry_extensions.md | `0ae4f9dc8235f5e9dd9446f646aaa15b25f5c3a4db467bb68979c9c9c7086dc6` | strip banner + revert 3 state/3 review lines reproduces `1f4115db...` exactly |

Each file gained an integration-status banner under its title; each claim's
`Review state` flipped `ready` -> `accepted` and each `Reviews: none.` now
links its sibling review. No proof body, claim statement, anchor, or author
prose was edited.

Navigation updated: results.md (two rows), research/n43/d18/README.md (one row),
docs/general_theorems/README.md (audit paragraph), lean/Ramsey/theorems/README.md
(catalogue status and the "Residual symmetry and descent" section header).
Historical reports and recorded input hashes elsewhere were left untouched.

## Limits

Acceptance here is an independent mathematical audit on the recorded
premises only. The census and degree premises (degrees 18..24,
`e(A)<=85`, `e(B)<=160`) and the small Ramsey values were assumed as
recorded, not re-certified. No claim was formalized in Lean by this audit,
no search use is unlocked beyond the claims' own gated wording, no
implementation or timing benefit is validated, no branch is closed, and no
novelty claim is made or checked.
