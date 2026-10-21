# Scoped engine experiments, 2026-10-19

The [session manifest](../2026-10-19-scoped-engine-experiments.json) records
commands, scopes, model hashes/counts, limits and measurements. All nine
nontrivial configurations timed out; no Ramsey branch was excluded.
The tiny control decisions validate tooling and are not branch closures.

On 2026-10-21, fourteen compressed exploratory OPB models totaling
56,746,958 bytes were removed under the
[retention policy](../../docs/reproducibility.md#retention-scope). Their names,
sizes and hashes are in the manifest's `retention_update`. Small graph inputs,
drivers, logs, measurements and the tiny control model remain.

The original artifact inventory and storage/validation results describe the
historical run. `analyze.py` expects the original model archives; it is not
a checker of the retained subset. Recreate any needed model using its recorded
generator revision, input and configuration in ignored scratch storage, then
compare its hash with the historical record. Original files also remain in
Git at `3eebcca5e627fdc3df5f26fd2a1925a7c121153f`.
