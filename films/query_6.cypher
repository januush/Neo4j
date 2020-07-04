1. CREATE (new_movie: Movie {title: "Captain America: The First Avenger", tagline:"When patriots become heroes",released:" 5 August 2011" })
2. CREATE (director:Person { name: 'Joe Johnston', born: '1950' })
3. MATCH (director: Person {name: "Joe Johnston"}), (movie: Movie {title: "Captain America: The First Avenger"})
CREATE (director)-[r:DIRECTED]->(movie) RETURN movie, director
4. CREATE (w1:Person { name: 'Christopher Markus'}),(w2:Person { name: 'Stephen McFeely'}),
(w3:Person { name: 'Joe Simon'}),(w4:Person { name: 'Jack Kirby'})
5. CREATE (a1:Person { name: 'Chris Evans'}),(a2:Person { name: 'Hayley Atwell'}),
(a3:Person { name: 'Sebastian Stan'}),(a4:Person { name: 'Tomme Lee Jones'})
6. MATCH (a1: Person {name: "Chris Evans"}),(a2: Person {name: "Hayley Atwell"}),(a3:Person { name: 'Sebastian Stan'}),(a4:Person { name: 'Tomme Lee Jones'}), (movie: Movie {title: "Captain America: The First Avenger"})
CREATE (a1)-[r1:ACTED]->(movie)
CREATE (a2)-[r2:ACTED]->(movie) 
CREATE (a3)-[r3:ACTED]->(movie) 
CREATE (a4)-[r4:ACTED]->(movie)
RETURN movie
7. MATCH (w1:Person { name: 'Christopher Markus'}),(w2:Person { name: 'Stephen McFeely'}),
(w3:Person { name: 'Joe Simon'}),(w4:Person { name: 'Jack Kirby'}), (movie: Movie {title: "Captain America: The First Avenger"})
CREATE (w1)-[r1:WROTE]->(movie)
CREATE (w2)-[r2:WROTE]->(movie) 
CREATE (w3)-[r3:WROTE]->(movie) 
CREATE (w4)-[r4:WROTE]->(movie)
RETURN movie
8. MATCH (people: Person)--(movie:Movie {title: "Captain America: The First Avenger"}) RETURN people, movie