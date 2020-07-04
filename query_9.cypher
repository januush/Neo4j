MATCH path = (origin:Airport)<-[r:ORIGIN|DESTINATION*..6]->(destination:Airport)
WITH origin, destination, REDUCE(acc = 0.0, n IN [x IN NODES(path) WHERE 'Flight' IN LABELS(x)] |
 acc + 1) AS allCitiesOnTheWay
 RETURN origin, destination, allCitiesOnTheWay ORDER BY allCitiesOnTheWay DESC

MATCH path = (a1: Airport {name: "LAX"})<-[r:ORIGIN|DESTINATION*..4]->(a2:Airport {name: "AUS"})
WITH a1,a2, REDUCE (acc = 0, n IN [x IN NODES(path) WHERE 'Flight' IN LABELS(x)] |
 acc + 1) AS allCitiesOnTheWay
 RETURN a1, a2,allCitiesOnTheWay

MATCH path = (a1: Airport {name: "LAX"})<-[r:ORIGIN|DESTINATION*..8]->(a2:Airport {name: "AUS"})
WITH a1,a2,path, REDUCE (acc = 0, n IN [x IN NODES(path) WHERE 'Flight' IN LABELS(x)] |
 acc + 1) AS allCitiesOnTheWay
 RETURN a1,path, a2,allCitiesOnTheWay ORDER BY allCitiesOnTheWay DESC

MATCH path = (a1: Airport {name: "LAX"})<-[r:ORIGIN|DESTINATION*..4]->(a2:Airport)
WITH a1,a2,path, REDUCE (acc = 0, n IN [x IN NODES(path) WHERE 'Flight' IN LABELS(x)] |
 acc + 1) AS allCitiesOnTheWay
 RETURN a1,path, a2,allCitiesOnTheWay ORDER BY allCitiesOnTheWay DESC

MATCH path = (a1: Airport {name: "LAX"})<-[r:ORIGIN|DESTINATION*..8]->(a2:Airport)
WITH a1,a2, REDUCE (acc = 0, n IN [x IN NODES(path) WHERE 'Flight' IN LABELS(x)] |
 acc + 1) AS allCitiesOnTheWay
 RETURN a1, a2,allCitiesOnTheWay ORDER BY allCitiesOnTheWay DESC

MATCH path = (a1: Airport )<-[r:ORIGIN|DESTINATION*..6]->(a2:Airport)
WHERE single(node in tail(nodes(path)) WHERE node:Flight)
RETURN a1,nodes(path), a2

MATCH (linia: Flight)-[r:ORIGIN|:DESTINATION]-(city:Airport)
WITH {
	  airline: linia.airline
} as lot
RETURN lot