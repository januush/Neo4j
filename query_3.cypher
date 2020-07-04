MATCH (p:peak{name:'Sandakphu'})-[r:twowheeler*{summer:'true'}]-(t:town{name:'Rimbik'})
UNWIND r AS rel
RETURN t,r,p, rel.distance
ORDER BY rel.distance DESC

// W przypadku drogi z Darjeeling nie znaleziono rezulatów dlatego przetestowałem zapytanie na innym mieście

MATCH (p:peak{name:'Sandakphu'})-[r:twowheeler*{summer:'true'}]-(t:town{name:'Darjeeling'})
UNWIND r AS rel
RETURN t,r,p, rel.distance
ORDER BY rel.distance DESC