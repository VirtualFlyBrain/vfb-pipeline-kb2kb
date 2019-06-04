MATCH (n) WHERE NOT EXISTS(n.iri) DELETE n;
MATCH p=()-[r:has_reference]->() WHERE r.iri is null DELETE r;