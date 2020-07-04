MATCH path = (origin:Airport { name:"LAX" })<-[r:ORIGIN|DESTINATION*..6]->(destination:Airport{name: "AUS"})
WITH origin, destination,  REDUCE(acc = 0.0, n IN [x IN NODES(path) WHERE 'Flight' IN LABELS(x)] |
 acc + [(n)<-[t:ASSIGN]-(ticket:Ticket {class: 'business'}) | ticket.price][0]) AS allFlightsTicketsCost
 RETURN origin, destination, min(allFlightsTicketsCost) as cheapestFlight