# Theory-only SDP/SOS pivot-selection research

Date: 2026-10-15. Author: pivot/SOS agent. Task: `sos-pivot-20261015`.
Base HEAD: `5c8d20526b37a1a74b6dbb3cb7540c6e829dec92`.

Deliverable: [quadratic pivot-selection proof note](../n43/d18/sos_pivot_selection.md),
SHA-256 `037901dc6de8864744ef9d5945d218624aaa575f889afc7c74650ccdf6f526e7`.
Four local deductions are ready for independent review, not accepted. No
solver, graph enumeration, catalogue acquisition, download, installation,
staging, or commit was performed. Exact rational arithmetic evaluated the
single explicitly conditional example; it did not search graphs.

The quadratic deliverable is a covariance certificate for
J=sum_(degree18 roots v)E_v. For H the higher-degree vertices, h=|H|,
e=e(H), W=sum excess, Z=sum excess^2, put
R=Z-W^2/h and V=(3/2)eh-4e^2/h. A weighted clique/spectral proof gives
sum d_H^2<=(3/2)eh. The literal sum of squares
sum_z(t*(epsilon_z-W/h)-(d_H(z)-2e/h))^2/t then proves, for rational t>0,

```text
J>=18W+Z-2eW/h-(t*R+V/t)/2.
```

This can improve safe maximum-neighborhood-edge root selection and dense
root family counts. The universal family excess cap is sharpened from W to
min(W,W/2+4). The conditional statistics h=10,W=50,Z=290,e(H)=36 and
t=3/4 give J>=801, a safely selected root q<=4,x<=169, and at least
fourteen degree-18 roots with q<=7. No realization of those statistics is
asserted.

The combinatorial deliverable strengthens the previously accepted
thirteen-root same-family overlap theorem to twelve roots: any twelve
degree-18 vertices contain an adjacent pair with codegree at most ten.
It uses the parent's all-high-overlap consequences and excludes its
remaining equality case. Triangle-free equality components would force
an eight-vertex triangle-free/no-I4 graph with nine edges, ruled out by a
short C5 argument. The remaining balanced tripartite components have total
part size four; they could cover at most sixteen ambient vertices with the
required full three-part attachments, but thirty-one need such attachments.

The conclusions hold across varying x and do not assume q<=2 or W<=10.
Every claim is conditional on the existence of degree-18 roots; this research
does not prove that every order-43 candidate has one. No branch is closed,
no construction or nonexistence certificate is produced, and no novelty
claim is made. The source census dependencies are retained rather than
re-certified. Exact input hashes and author self-checks appear in the proof
note. The coordinator owns shared navigation, WORK, and eventual integration.

Suggested integration after independent review: record the new twelve-root
threshold beside the existing thirteen-root coverage result; retain both
covariance and older weighted cut bounds and use their maximum; apply
safe selected-root restrictions only under the stated root-selection rule.
Any future two-root exhaustive family must cover every compatible overlap
map and completion, as before.
