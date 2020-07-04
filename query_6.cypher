MATCH path = (origin:Airport { name:"LAX" })<-[r:ORIGIN|DESTINATION*..6]->(destination:Airport{name: "AUS"})
RETURN path, REDUCE(s = 0, n IN [x IN NODES(path) WHERE 'Flight' IN LABELS(x)] |
  s + [(n)<-[:ASSIGN]-(ticket) | ticket.price][0] ) AS allFlightsTicketsCost ORDER BY allFlightsTicketsCost DESC

// nie znalazłem żadnych lotów z "LAX" do "DAY" dlatego użyłem lotniska "AUS", aby zaprezentować metodę.