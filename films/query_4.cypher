MATCH (hugo:Person {name:"Hugo Weaving"})-[:ACTED_IN]->(hugoWeavingMovies)<-[:ACTED_IN]-(coActors) RETURN coActors, hugoWeavingMovies