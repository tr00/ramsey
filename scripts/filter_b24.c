/* B-only audit/filter for complements of Ramsey(4,5,24) graphs.
 * Uses nauty/gtools for graph6 I/O; no A, rows, columns or solver.
 * Build: cc -O3 -std=c11 -Wall -Wextra -Werror -Ithird-party/nauty/build
 *        -Ithird-party/nauty/src
 *        scripts/filter_b24.c third-party/nauty/build/nauty.a -o FILTER
 * Run: FILTER INPUT_B.g6 SURVIVORS.g6 METRICS.tsv REJECTIONS.tsv
 * Input/output graph indices are one-based; vertex witnesses are zero-based.
 *
 * Necessary predicates: 144<=e(B)<=160, 10<=d_B<=17, and every K4
 * has internal degree sum <=60. Sources: research/n43/reductions.md sections
 * 5.3, 8.1 and research/n43/d18/cliques_augmentation.md section 1.
 * The scalar degree-sum relaxation is 432<=2e(B)+x<=576 for some
 * integer 136<=x<=279. It does NOT construct or certify an extension.
 * Saturation diagnostic: adding a missing F-edge is safe iff its common
 * F-neighborhood has no edge, where F=complement B (already K4-free).
 */
#include "gtools.h"
#include <stdint.h>
#include <inttypes.h>

#define N 24
#define ALL ((UINT32_C(1) << N) - 1)

static int pop(uint32_t s) { return __builtin_popcount(s); }
static int first(uint32_t s) { return __builtin_ctz(s); }
static uint32_t after(int i) { return ALL & ~((UINT32_C(1) << (i + 1)) - 1); }

static int has_edge(const uint32_t adj[N], uint32_t s)
{
    while (s) {
        int i = first(s);
        s &= s - 1;
        if (adj[i] & s) return 1;
    }
    return 0;
}

int main(int argc, char **argv)
{
    if (argc != 5) {
        fprintf(stderr, "Usage: %s INPUT_B.g6 SURVIVORS.g6 METRICS.tsv REJECTIONS.tsv\n", argv[0]);
        return 2;
    }
    /* Refuse path aliases before opening any output. */
    for (int i = 1; i < argc; ++i)
        for (int j = i + 1; j < argc; ++j)
            if (!strcmp(argv[i], argv[j])) {
                fprintf(stderr, "Input and output paths must be distinct\n");
                return 2;
            }
    int code;
    FILE *in = opengraphfile(argv[1], &code, FALSE, 1);
    if (!in) return 2;
    if (!(code & GRAPH6)) {
        fprintf(stderr, "Expected graph6 input\n");
        fclose(in);
        return 2;
    }
    FILE *out = fopen(argv[2], "w");
    FILE *metrics = fopen(argv[3], "w");
    FILE *reject = fopen(argv[4], "w");
    if (!out || !metrics || !reject) {
        perror("opening outputs");
        return 2;
    }
    fprintf(metrics, "index\tedges\tmin_degree\tmax_degree\tk4_count\tmax_k4_degree_sum\tsafe_F_additions\tx_lo\tx_hi\taccepted\n");
    fprintf(reject, "index\tpredicate\twitness\n");
    uint64_t total = 0, kept = 0, bad_edge = 0, bad_degree = 0;
    uint64_t bad_clique = 0, bad_sum = 0, nonsaturated = 0;
    graph g[N * SETWORDSNEEDED(N)];
    int m = SETWORDSNEEDED(N);
    char *line;
    while ((line = gtools_getline(in))) {
        ++total;
        if (checkgline(line) || line[0] != 'W' || graphsize(line) != N) {
            fprintf(stderr, "Invalid order-24 graph6 record at index %" PRIu64 "\n", total);
            return 2;
        }
        stringtograph(line, g, m);
        uint32_t b[N], f[N];
        int d[N], edges = 0, lo = N, hi = 0;
        for (int i = 0; i < N; ++i) {
            b[i] = 0;
            for (int j = 0; j < N; ++j)
                if (ISELEMENT(GRAPHROW(g, i, m), j)) b[i] |= UINT32_C(1) << j;
            if (b[i] & (UINT32_C(1) << i)) {
                fprintf(stderr, "Loop at index %" PRIu64 "\n", total);
                return 2;
            }
            f[i] = ALL ^ b[i] ^ (UINT32_C(1) << i);
            d[i] = pop(b[i]);
            edges += d[i];
            if (d[i] < lo) lo = d[i];
            if (d[i] > hi) hi = d[i];
        }
        edges /= 2;
        int k4 = 0, maxsum = 0, witness[4] = {-1,-1,-1,-1};
        /* Enumerate each B K4 once; also audit no B K5. */
        for (int i = 0; i < N; ++i) {
            uint32_t js = b[i] & after(i);
            while (js) {
                int j = first(js); js &= js - 1;
                uint32_t common = b[i] & b[j];
                uint32_t ks = common & after(j);
                while (ks) {
                    int k = first(ks); ks &= ks - 1;
                    uint32_t ls = common & b[k] & after(k);
                    while (ls) {
                        int l = first(ls); ls &= ls - 1;
                        ++k4;
                        if (common & b[k] & b[l]) {
                            fprintf(stderr, "Invalid catalogue: K5 in B at index %" PRIu64 "\n", total);
                            return 2;
                        }
                        int s = d[i] + d[j] + d[k] + d[l];
                        if (s > maxsum) {
                            maxsum = s;
                            witness[0]=i; witness[1]=j; witness[2]=k; witness[3]=l;
                        }
                    }
                }
            }
        }
        /* Audit no I4 in B, equivalently no K4 in F. */
        for (int i = 0; i < N; ++i) {
            uint32_t js = f[i] & after(i);
            while (js) {
                int j = first(js); js &= js - 1;
                if (has_edge(f, f[i] & f[j])) {
                    fprintf(stderr, "Invalid catalogue: I4 in B at index %" PRIu64 "\n", total);
                    return 2;
                }
            }
        }
        int safe = 0;
        for (int i = 0; i < N; ++i) {
            uint32_t js = b[i] & after(i); /* Missing F-edges. */
            while (js) {
                int j = first(js); js &= js - 1;
                safe += !has_edge(f, f[i] & f[j]);
            }
        }
        nonsaturated += safe > 0;
        int xl = 432 - 2 * edges, xh = 576 - 2 * edges;
        if (xl < 136) xl = 136;
        if (xh > 279) xh = 279;
        int good = 1;
        if (edges < 144 || edges > 160) {
            ++bad_edge; good = 0;
            fprintf(reject, "%" PRIu64 "\tedges\t%d\n", total, edges);
        }
        if (lo < 10 || hi > 17) {
            ++bad_degree; good = 0;
            fprintf(reject, "%" PRIu64 "\tdegree_range\t%d,%d\n", total, lo, hi);
        }
        if (maxsum > 60) {
            ++bad_clique; good = 0;
            fprintf(reject, "%" PRIu64 "\tk4_degree_sum\t%d,%d,%d,%d:%d\n", total,
                    witness[0], witness[1], witness[2], witness[3], maxsum);
        }
        if (xl > xh) {
            ++bad_sum; good = 0;
            fprintf(reject, "%" PRIu64 "\tdegree_sum_interval\t%d,%d\n", total, xl, xh);
        }
        if (good) { ++kept; writeg6(out, g, m, N); }
        fprintf(metrics, "%" PRIu64 "\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\n",
                total, edges, lo, hi, k4, maxsum, safe, xl, xh, good);
    }
    int failed = ferror(in) || ferror(out) || ferror(metrics) || ferror(reject);
    failed |= fclose(in) != 0;
    failed |= fclose(out) != 0;
    failed |= fclose(metrics) != 0;
    failed |= fclose(reject) != 0;
    if (failed) { perror("catalogue I/O"); return 2; }
    printf("{\"graphs\":%" PRIu64 ",\"survivors\":%" PRIu64
           ",\"rejected\":%" PRIu64 ",\"edge_failures\":%" PRIu64
           ",\"degree_failures\":%" PRIu64 ",\"four_clique_failures\":%" PRIu64
           ",\"degree_sum_failures\":%" PRIu64 ",\"nonmaximal_originals\":%" PRIu64 "}\n",
           total, kept, total-kept, bad_edge, bad_degree, bad_clique, bad_sum, nonsaturated);
    return 0;
}
