#!/usr/bin/env python3
"""Scientific checks for small irreducible cores and clique-complex H_2.

Only graph-local checks are made. No complete degree-18 catalogue or ambient
order-43 extension is asserted. Uses only the Python standard library and the
reviewed local contraction module. Evidence is written only with --write.
"""
import argparse
import json
import sys
from itertools import combinations
from pathlib import Path

PARENT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(PARENT))
from safe_contractions import certificate, contract
from verify_safe_contractions import load_examples, valid


def betti2(adj):
    """Second Betti number over F_2 of a K4-free graph's clique complex.

    There are no three-simplices, so beta2 is nullity of the triangle-to-edge
    boundary matrix. Each triangle column has its three edge entries equal1.
    """
    vertices = sorted(adj)
    if any(all(v in adj[u] for u,v in combinations(t,2))
           for t in combinations(vertices,4)):
        raise ValueError('K4-free graph required')
    edges = [(u,v) for u,v in combinations(vertices,2) if v in adj[u]]
    indexes = {e:i for i,e in enumerate(edges)}
    pivots = {}
    triangles = 0
    for t in combinations(vertices,3):
        if not all(v in adj[u] for u,v in combinations(t,2)):
            continue
        triangles += 1
        column = sum(1 << indexes[e] for e in combinations(t,2))
        while column:
            pivot = column.bit_length() - 1
            if pivot not in pivots:
                pivots[pivot] = column
                break
            column ^= pivots[pivot]
    return {'n':len(adj),'edges':len(edges),'triangles':triangles,
            'triangle_boundary_rank_F2':len(pivots),
            'beta2_F2':triangles-len(pivots)}


def connected(adj):
    if not adj:return False
    seen=set(); frontier={min(adj)}
    while frontier:
        seen |= frontier
        frontier=set().union(*(adj[v] for v in frontier)) - seen
    return len(seen)==len(adj)


def enumerate_small():
    result = []
    injection_checks = 0
    for n in range(1,7):
        pairs=list(combinations(range(n),2))
        connected_count=0;irreducible=0;octahedra=0
        for mask in range(1 << len(pairs)):
            adj={v:set() for v in range(n)}
            for i,(u,v) in enumerate(pairs):
                if mask >> i &1:adj[u].add(v);adj[v].add(u)
            if not connected(adj):continue
            if any(all(v in adj[u] for u,v in combinations(t,2))
                   for t in combinations(range(n),4)):continue
            connected_count+=1
            safe=[e for e in pairs if e[1] in adj[e[0]] and certificate(adj,*e)['safe']]
            b=betti2(adj)['beta2_F2']
            for e in safe:
                child,_=contract(adj,*e)
                assert betti2(child)['beta2_F2']>=b
                injection_checks+=1
            if not safe:
                irreducible+=1
                if n==6:
                    # The complement is a perfect matching iff this is K2,2,2.
                    assert all(len(adj[v])==4 for v in adj)
                    assert b==1
                    octahedra+=1
        result.append({'n':n,'connected_K4_free_labeled':connected_count,
                       'irreducible_labeled':irreducible,
                       'octahedron_labeled':octahedra})
    return result,injection_checks


def check_retained():
    result=[]
    for entry in load_examples():
        adj={u:set() for u in range(entry['n'])}
        for u,v in entry['edges']:adj[u].add(v);adj[v].add(u)
        result.append({'name':entry['name'],**betti2(adj)})
    return result


def check_growth(source):
    """Verify one supplied order17 inverse-cone construction to one vertex."""
    record=json.loads(source.read_text())
    adj={v:set() for v in record['labels']}
    for u,v in record['edges']:adj[u].add(v);adj[v].add(u)
    assert len(adj)==17 and valid(adj)
    stats=betti2(adj);assert stats['beta2_F2']==0
    reps={v:v for v in adj};history=[]
    for split in reversed(record['growth']):
        u,v=(reps[x] for x in split['pair'])
        assert certificate(adj,u,v)['safe']
        adj,z=contract(adj,u,v);history.append([u,v])
        for x in split['pair']:del reps[x]
        reps[split['z']]=z
        assert valid(adj) and betti2(adj)['beta2_F2']==0
    # The recovered cone over the 13-vertex circulant contracts by its spokes.
    hub=reps[13]
    for base in range(13):
        v=reps[base]
        assert v in adj[hub] and certificate(adj,hub,v)['safe']
        history.append([hub,v])
        adj,hub=contract(adj,hub,v)
        reps[13]=hub
        assert valid(adj) and betti2(adj)['beta2_F2']==0
    assert len(adj)==1
    return {'n':17,'labels':record['labels'],'edges':record['edges'],
            'initial_stats':stats,'growth':record['growth'],
            'safe_history_to_one':history,
            'scope':'Pure order17 scientific example, not a degree18 branch instance.'}


def check_order18_source():
    entry = next(item for item in load_examples()
                 if item['name'] == 'scientific_17_contractions_to_one')
    adj = {u:set() for u in range(entry['n'])}
    for u,v in entry['edges']:
        adj[u].add(v); adj[v].add(u)
    assert valid(adj) and betti2(adj)['beta2_F2'] == 0
    for u,v in entry['contract']:
        assert certificate(adj,u,v)['safe']
        adj,_ = contract(adj,u,v)
        assert valid(adj) and betti2(adj)['beta2_F2'] == 0
    assert len(adj) == 1 and len(entry['contract']) == 17
    return {'source':'../safe_contraction_evidence.json',
            'safe_contractions_checked':17,
            'initial_beta2_F2':0,'final_n':1,
            'name':entry['name']}


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write',action='store_true')
    parser.add_argument('--growth-source',type=Path)
    args=parser.parse_args()
    small,checks=enumerate_small()
    data={'scope':'Graph-only scientific checks; no order18 family completeness.',
          'small_labeled_census':small,'homology_injection_edge_checks':checks,
          'retained_order18_beta2':check_retained()}
    if args.growth_source:data['order17_to_one']=check_growth(args.growth_source)
    order18 = check_order18_source()
    if order18 is not None:data['order18_to_one'] = order18
    if args.write:
        Path(__file__).with_name('minimum_safe_core_evidence.json').write_text(json.dumps(data,indent=2)+'\n')
    print(json.dumps({k:v for k,v in data.items() if k!='order17_to_one'},indent=2))
    if 'order17_to_one' in data:print('Verified order17 example reaches one vertex in16 safe contractions.')

if __name__=='__main__':main()
