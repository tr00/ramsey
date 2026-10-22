# Independent review of anchored-cell attachment rigidity

Editorially condensed on 2026-10-21; [original audit and lineage](../../reports/2026-10-21-research-cleanup.md).

Date: 2026-10-15.
Author: Codex cell-attachment author.
Reviewer: Codex cell-obligations agent, a distinct collaborating agent.

Claim(s): all three claims in `research/n43/d18/cell_attachments.md`:
`claim-c5-omission-budget`, `claim-u13-c5-rigidity`, and
`claim-external-independent-demands`.

Reviewed revision: exact uncommitted source SHA-256
`6a8b8981a221ce07dfa41805797ce374ad9996e0b482abf91bde3fbfbaebe743`.
Repository HEAD during review:
`f98a1285b7adc9720a693ae3a54fba212a021bdf`.

Dependencies reviewed: `anchored_cell_averaging.md`, SHA-256
`719fe4120c38550ee80d88cd6d9c48d8703959c46536daecae9ea17519c1a6e3`,
especially the independently accepted cell-type claim;
`cell_intersections.md`, SHA-256
`cc05444b193403ba5ef614ed75f1acfba566afda576e7a3fe473c08aac4144b7`,
whose five claims this reviewer independently accepted in
[the intersection review](review_cell_intersections_20261015_obligations.md).
The established external R(4,3)=9 premise is retained without primary-source
reproof. All attachment algebra and rigidity arguments below were derived
independently of the author's self-audit.

## Checks, findings and original outcome

All three claims were independently checked on actual cells, with no x/E
restriction. Cycle omission signatures are cliques; U no-I3 gives at most
four nonneighbors. The C5 omission count is 5t-M, shared omissions force
adjacency, and triangle-plus-common-S-edge witnesses prove the pair rules.
The initial lower endpoint max(0,t-6+|D_y|) was valid but one unit weak;
the reviewer supplied the sharpening later accepted below.

At U13, every degree is 8, M10, e(Y)17. Complete-overlap vertices W have
Y-codegree0; incidence gives |W|<=2, and the omission-partition argument
excludes a nonadjacent pair in W. The three count vectors are necessary
possibilities, not constructions. Outside independent-pair/triple attachment
demands follow from actual B no-I4 and U no-I3, with the stated disjointness.
Original outcome: **accepted** for all three claims, with optional sharpening.

## Renewed review of the stronger medium-size endpoint

Date: 2026-10-15. Author and reviewer identities are unchanged.
The original review's hash, outcome and finding are retained above; the
full prior audit is available at the cleanup's base Git revision.

Renewed reviewed revision: `cell_attachments.md` SHA-256
`01246b17c14f43a5cc8e879f87c056376b3269c4f5670eeb80acbe82a52bb810`.
I re-read the entire revised file. The only mathematical change from the
prior reviewed source is the medium-size lower endpoint

    max(0,t-6+|D_y|)  ->  max(0,t-5+|D_y|).

For every y in Y, U no I3 makes its nonneighbors a clique of size
at most four, so d_U(y)>=|U|-5=t. The actual partition of its neighbors
gives d_U(y)=5-|D_y|+d_Y(y). Therefore
d_Y(y)>=t-5+|D_y|, intersected with d_Y(y)>=0, as recorded in the
revised claim. The upper endpoint and all other statements are unchanged.
At t=8 this stronger lower endpoint equals the existing upper endpoint
3+|D_y|, independently agreeing with U13 regularity. At t=0 there is
no y in Y and the assertion remains vacuous. All t=1..7 are covered by
the same exact derivation without a saturation assumption.

Outcome at the renewed exact hash: **accepted**, all three claims.
The historical optional-sharpening comment has now been implemented and
fully reviewed; there is no outstanding source correction. All scopes,
dependencies, permitted propagation uses, and limits recorded above remain
in force.

Limits: propagation/local rejection on actual-cell hypotheses only. No
unavoidable saturated cell, realizability, branch closure, novelty assessment
or formal certificate. External Ramsey inputs remain recorded premises.
