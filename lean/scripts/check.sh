#!/bin/sh
# Consistency gate for the Lean formalization. Run from any directory:
#   sh scripts/check.sh          (set CHECK_VERBOSE=1 for per-file detail)
#
# 0. lean-toolchain matches the Mathlib rev pinned in lakefile.toml
# 1. lake build succeeds for the whole module graph
# 2. every .lean file elaborates; sorry warnings match
#    scripts/sorry-ledger.txt exactly (unlisted files must have none)
# 3. no em-dash in .lean files outside scripts/style-allowlist.txt
# 4. #print axioms of scripts/Audit.lean matches scripts/expected-axioms.txt
#    modulo whitespace and axiom-list order
#
# A Lean handoff is complete only when this script exits 0. When a change is
# intentional, update the ledger, allowlist and expectations in the same
# change:
#   lake env lean scripts/Audit.lean > scripts/expected-axioms.txt
set -u
cd "$(dirname "$0")/.."

verbose=${CHECK_VERBOSE:-0}
fail=0
say() { printf '%s\n' "$*"; }

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT INT TERM

# --- 0. toolchain pin ------------------------------------------------------
tool=$(sed -n 's|^leanprover/lean4:||p' lean-toolchain | tr -d '[:space:]')
rev=$(sed -n 's|^rev = "\(.*\)"$|\1|p' lakefile.toml)
if [ -n "$tool" ] && [ "$tool" = "$rev" ]; then
  say "ok   pin: lean-toolchain $tool == mathlib rev $rev"
else
  say "FAIL pin: lean-toolchain '$tool' != lakefile mathlib rev '$rev'"
  fail=1
fi

# --- 1. build --------------------------------------------------------------
if lake build > "$tmp/build.log" 2>&1; then
  say "ok   build"
else
  say "FAIL build:"
  grep '^error' "$tmp/build.log" | sort -u
  fail=1
fi

# --- 2. per-file elaboration and sorry ledger ------------------------------
sed 's/#.*//' scripts/sorry-ledger.txt | tr -d '\r' | awk 'NF { print $1, $2 }' \
  > "$tmp/ledger.txt"
files="Ramsey.lean $(find Ramsey -name '*.lean' | sort)"
for f in $files; do
  log="$tmp/elab.log"
  if ! lake env lean "$f" > "$log" 2>&1; then
    say "FAIL elab: $f"
    grep -E ': error:|^error:' "$log" | sort -u || say "  (no error lines captured)"
    fail=1
  fi
  got=$(grep -c 'declaration uses .sorry.' "$log")
  want=$(awk -v f="$f" '$1 == f { print $2 }' "$tmp/ledger.txt")
  [ -n "$want" ] || want=0
  if [ "$got" != "$want" ]; then
    say "FAIL sorry: $f has $got sorry warning(s), ledger says $want"
    fail=1
  elif [ "$verbose" = 1 ]; then
    say "ok   sorry: $f ($got)"
  fi
done
for path in $(awk '{ print $1 }' "$tmp/ledger.txt"); do
  if [ ! -f "$path" ]; then
    say "FAIL ledger: $path no longer exists, drop the entry"
    fail=1
  fi
done

# --- 3. style: no new em-dashes -------------------------------------------
sed 's/#.*//' scripts/style-allowlist.txt | tr -d '\r' | awk 'NF { print $1 }' \
  > "$tmp/allow.txt"
for f in $files; do
  if grep -q '—' "$f" && ! printf '%s\n' "$f" | grep -qxF -f "$tmp/allow.txt"; then
    say "FAIL style: em-dash in $f (rewrite the comment, or grandfather it in scripts/style-allowlist.txt)"
    fail=1
  fi
done

# --- 4. axiom audit --------------------------------------------------------
if [ "$fail" -eq 0 ]; then
  if ! lake env lean scripts/Audit.lean > "$tmp/audit.raw" 2>&1; then
    say "FAIL audit: scripts/Audit.lean did not elaborate"
    grep -E ': error:|^error:' "$tmp/audit.raw" | sort -u
    fail=1
  else
    awk -f scripts/canon-axioms.awk "$tmp/audit.raw" > "$tmp/audit.canon"
    awk -f scripts/canon-axioms.awk scripts/expected-axioms.txt \
      > "$tmp/expected.canon"
    if diff -u "$tmp/expected.canon" "$tmp/audit.canon" > "$tmp/audit.diff"; then
      say "ok   audit: axiom sets match scripts/expected-axioms.txt"
    else
      say "FAIL audit: axiom sets differ from scripts/expected-axioms.txt"
      cat "$tmp/audit.diff"
      fail=1
    fi
  fi
else
  say "SKIP audit: fix the failures above first"
fi

if [ "$fail" -eq 0 ]; then
  say "PASS: build, ledger, style and axiom audit all green"
else
  say "FAIL: see above"
fi
exit "$fail"
