MATCH (town1:town { name: 'Darjeeling' }),(town2:peak { name: 'Sandakphu' }), p = allShortestPaths((town1)-[*]-(town2))
RETURN town1, p, town2