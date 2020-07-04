MATCH path = (origin:Airport { name:"LAX" })<-[*1..4]->(destination:Airport)
WHERE REDUCE(s = 0, n IN [x IN NODES(path) WHERE 'Flight' IN LABELS(x)] |
  s + [(n)<-[:ASSIGN]-(ticket) | ticket.price][0]
  ) < 3000
RETURN origin, path, destination