MATCH path = (origin:Airport { name:"LAX" })<-[r:ORIGIN|DESTINATION*..6]->(destination:Airport{name: "AUS"})
RETURN origin,path,destination, REDUCE(s = 0, n IN [x IN NODES(path) WHERE 'Flight' IN LABELS(x)] |
  s + [(n)<-[:ASSIGN]-(ticket:Ticket {class: 'economy'}) | ticket.price][0] ) AS allFlightsTicketsCost ORDER BY allFlightsTicketsCost ASC LIMIT 1

// Podobnie jak w przykładzie 6 znalazłem lot z "LAX" do "AUS".