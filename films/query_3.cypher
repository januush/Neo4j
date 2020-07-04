MATCH (hugo:Person {name:"Hugo Weaving"})-[:ACTED_IN]->(hugoWeavingMovies)<-[:DIRECTED]-(hugoWeavingMoviesDirectors)
RETURN DISTINCT hugoWeavingMoviesDirectors