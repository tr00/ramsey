# Canonicalize `#print axioms` output: join line-wrapped entries and sort
# each axiom list, so expected and actual compare modulo formatting.
# Output: one line per theorem, `name: ax1, ax2, ...` (or `name: (none)`).
BEGIN { buf = "" }
{
  if (buf == "") buf = $0; else buf = buf " " $0
  if (buf ~ /does not depend on any axioms/) {
    name = buf
    sub(/ does not depend on any axioms.*/, "", name)
    gsub(/'/, "", name)
    printf "%s: (none)\n", name
    buf = ""
    next
  }
  if (buf ~ /\][ ]*$/) {
    name = buf
    sub(/ depends on axioms: .*/, "", name)
    gsub(/'/, "", name)
    list = buf
    sub(/.*\[/, "", list)
    sub(/\].*/, "", list)
    n = split(list, a, ",")
    for (i = 1; i <= n; i++) gsub(/^ +| +$/, "", a[i])
    for (i = 2; i <= n; i++) {
      v = a[i]
      for (j = i - 1; j >= 1 && a[j] > v; j--) a[j + 1] = a[j]
      a[j + 1] = v
    }
    printf "%s:", name
    for (i = 1; i <= n; i++) printf " %s", a[i]
    printf "\n"
    buf = ""
  }
}
