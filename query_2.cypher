MATCH (darjeeling { name: 'Darjeeling' }),(sandakphu { name: 'Sandakphu' }), 
    paths = allShortestPaths((darjeeling)-[*]-(sandakphu))
WHERE ALL (p IN relationships(paths) WHERE p.winter = 'true')
RETURN paths