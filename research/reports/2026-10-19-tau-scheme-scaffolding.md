# Tau-branch scheme scaffolding under research/n43/d18

Date: 2026-10-19. Task token: `tau-scaffold-20261019`. Agent: Main, working
alone. No computation, solver run, catalogue processing, download, or Lean
change was performed. No exclusion is claimed.

## What was created

| Path | Content |
| --- | --- |
| `research/n43/d18/tau/README.md` | Scheme: shared assumptions (S1)-(S5), established inputs with review states, coverage argument, applicability table x=136..143+, scope limits |
| `research/n43/d18/tau/symmetry.md` | `claim-tau-symmetry-01` (ready): A-label relocation collapses labeled transversal branches to `T={a_0,...,a_{t-1}}`; caveats for added rows |
| `research/n43/d18/tau/t4/README.md` | Rung t4 assumptions; defect budget `u+w+t=3+q`; UNSAT meaning `tau_4>=5`; no arithmetic kill (65 < 68+q) |
| `research/n43/d18/tau/t5/README.md` | Rung t5 assumptions; weaker floors (33/25/2, total 60 < 68+q, derived here); terminal for x<=143 |
| `research/n43/d18/tau/columns5/README.md` | Relaxation branch; pairing coverage with t4 without t5; r=0 count structure; no dependence on the relocation claim |
| `research/n43/d18/tau/closure/README.md` | `claim-tau-closure-01` (ready): `24*tau_4<=x`, terminal contradiction, rung-count formula beyond 143 |

## Design decisions

- The scheme is an overlay on the existing x-cell and q-profile splits, not
  a new partition. `columns5` deliberately duplicates no per-x content; at
  x=137 it coincides with the live r0 space, at x>=138 with each r=0
  subcase.
- Applicability follows the current checkout state: x136 closed per user
  report; x137 needs only t5 (four-set transversal exclusion accepted
  2026-10-18); x138..143 need t4, t5, closure; x>=144 rungs deferred.
- The ladder needs no q<=2 premise; only column-floor structure inside
  branches does.

## Pending independent review

1. `research/n43/d18/tau/symmetry.md#claim-tau-symmetry-01` — all rung refutations
   are conditional on it until reviewed.
2. `research/n43/d18/tau/closure/README.md#claim-tau-closure-01` — elementary, but
   load-bearing with search use `terminate`.

The t=5 specialization `33+25+2=60<68+q` in `t5/README.md` is derived from
accepted `claim-transversal-deletion-01` and the published order-13 census
minimum; flag it during any review of that file.

## Coordinator handoff (shared indexes intentionally untouched)

Per `docs/workflow.md`, `WORK.md`, `results.md`, and the d18 README child
table are coordinator-owned. Suggested integration:

- d18 README: one child/overlay row for `research/n43/d18/tau` after the two claims
  are reviewed.
- WORK.md row suggestion:
  `| tau-scaffold-20261019 | Main alone | Working tree | research/n43/d18/tau/**; research/reports/2026-10-19-tau-scheme-scaffolding.md | Complete: scaffolding for tau_4-rung refutation decomposition x=137..143; two ready unreviewed claims; no runs |`

## Authorization note

Any rung run (OPB generation, RoundingSat invocation, or enumeration) is
computational exploration, paused by default under `.agents/AGENTS.md`.
Each run needs explicit user authorization, exact row/constraint records,
and measured OPB and proof-trace sizes before proof logging is enabled
(`docs/reproducibility.md`).
