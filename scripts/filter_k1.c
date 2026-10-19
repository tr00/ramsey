/* Exact induced 17-vertex 8-regular K4/I4-free row search in B24.
 * Uses local nauty/gtools graph6 I/O. Vertices and witness masks are zero-based.
 * Run: FILTER INPUT.g6 SURVIVORS.g6 WITNESSES.tsv [LIMIT]
 * I4-freeness is checked on each input; K4-freeness and regularity are searched.
 * Branches partition assignments: delete one vertex of an uncovered K4,
 * keeping its earlier alternatives. Degree propagation never drops a solution.
 */
#include "gtools.h"
#include <stdint.h>
#include <inttypes.h>

#define N 24
#define ALL ((UINT32_C(1) << N) - 1)
static uint32_t adj[N], cliques[10626], witness;
static int nc;
static uint64_t nodes;
static int pop(uint32_t s) { return __builtin_popcount(s); }
static uint32_t vertex_bit(int v) { return UINT32_C(1) << v; }

static int search(uint32_t keep, uint32_t drop)
{
    ++nodes;
    for (;;) {
        uint32_t oldkeep = keep, olddrop = drop;
        if ((keep & drop) || pop(keep) > 17 || pop(drop) > 7) return 0;
        uint32_t unknown = ALL & ~(keep | drop);
        if (pop(keep) == 17) drop |= unknown;
        if (pop(drop) == 7) keep |= ALL & ~(keep | drop);
        for (int v = 0; v < N; ++v) {
            if (drop & vertex_bit(v)) continue;
            int lo = pop(adj[v] & keep), hi = pop(adj[v] & ~drop);
            if (lo > 8 || hi < 8) {
                if (keep & vertex_bit(v)) return 0;
                drop |= vertex_bit(v);
            } else if (keep & vertex_bit(v)) {
                if (lo == 8) drop |= adj[v] & ~keep;
                if (hi == 8) keep |= adj[v] & ~drop;
            }
        }
        for (int c = 0; c < nc; ++c) {
            if (cliques[c] & drop) continue;
            uint32_t choices = cliques[c] & ~keep;
            if (!choices) return 0;
            if (!(choices & (choices - 1))) drop |= choices;
        }
        if (oldkeep == keep && olddrop == drop) break;
    }
    if (pop(keep) == 17) { witness = keep; return 1; }
    uint32_t choices = 0;
    int best = N + 1;
    for (int c = 0; c < nc; ++c) {
        if (cliques[c] & drop) continue;
        uint32_t available = cliques[c] & ~keep;
        if (pop(available) < best) { best = pop(available); choices = available; }
    }
    if (!choices) {
        /* No uncovered K4: still enforce the size and regularity equations. */
        uint32_t unknown = ALL & ~(keep | drop);
        choices = unknown & -unknown;
    }
    while (choices) {
        uint32_t b = choices & -choices;
        choices ^= b;
        if (search(keep, drop | b)) return 1;
        keep |= b;
    }
    /* K4 branching already exhausts the clause; binary fallback also keeps b. */
    if (best == N + 1) return search(keep, drop);
    return 0;
}

int main(int argc, char **argv)
{
    if (argc != 4 && argc != 5) {
        fprintf(stderr, "usage: %s INPUT SURVIVORS WITNESSES [LIMIT]\n", argv[0]);
        return 2;
    }
    for (int i = 1; i < 4; ++i)
        for (int j = i + 1; j < 4; ++j)
            if (!strcmp(argv[i], argv[j])) return 2;
    uint64_t limit = argc == 5 ? strtoull(argv[4], NULL, 10) : UINT64_MAX;
    int code;
    FILE *in = opengraphfile(argv[1], &code, FALSE, 1);
    if (!in || !(code & GRAPH6)) return 2;
    FILE *out = fopen(argv[2], "w"), *rows = fopen(argv[3], "w");
    if (!out || !rows) return 2;
    fprintf(rows, "index\trow_mask_hex\n");
    graph g[N * SETWORDSNEEDED(N)];
    int m = SETWORDSNEEDED(N);
    uint64_t total = 0, kept = 0;
    char *line;
    while (total < limit && (line = gtools_getline(in))) {
        ++total;
        if (checkgline(line) || graphsize(line) != N) return 2;
        stringtograph(line, g, m);
        for (int v = 0; v < N; ++v) {
            adj[v] = 0;
            for (int w = 0; w < N; ++w)
                if (ISELEMENT(GRAPHROW(g, v, m), w)) adj[v] |= vertex_bit(w);
        }
        nc = 0;
        for (int a = 0; a < N; ++a)
            for (int b = a + 1; b < N; ++b)
                for (int c = b + 1; c < N; ++c)
                    for (int d = c + 1; d < N; ++d) {
                        uint32_t s = vertex_bit(a) | vertex_bit(b) | vertex_bit(c) | vertex_bit(d);
                        int edges = pop(adj[a] & s) + pop(adj[b] & s)
                                  + pop(adj[c] & s) + pop(adj[d] & s);
                        if (edges == 0) {
                            fprintf(stderr, "input I4 at index %" PRIu64 "\n", total);
                            return 2;
                        }
                        if (edges == 12) cliques[nc++] = s;
                    }
        if (search(0, 0)) {
            ++kept;
            fputs(line, out);
            fprintf(rows, "%" PRIu64 "\t%06" PRIx32 "\n", total, witness);
        }
    }
    int failed = ferror(in) || ferror(out) || ferror(rows);
    failed |= fclose(in) != 0;
    failed |= fclose(out) != 0;
    failed |= fclose(rows) != 0;
    printf("{\"graphs\":%" PRIu64 ",\"survivors\":%" PRIu64
           ",\"rejected\":%" PRIu64 ",\"search_nodes\":%" PRIu64 "}\n",
           total, kept, total - kept, nodes);
    return failed ? 2 : 0;
}
