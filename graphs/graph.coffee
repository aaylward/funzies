class Graph
  constructor: (@vertices=[], @edges=[]) ->

  randomEdge: ->
    @edges[Math.floor(Math.random() * @edges.length)]

  contract: ->
    [replacement, nodeToReplace] = @randomEdge()
    for edge, idx in @edges
      if @edges[idx][0] is nodeToReplace
        @edges[idx][0] = replacement
      if @edges[idx][1] is nodeToReplace
        @edges[idx][1] = replacement

    @removeCircularEdges()
    @vertices.splice @vertices.indexOf(nodeToReplace), 1

  kargerRandomCut: ->
    # probability of min-cut is (1/n^2)
    while @vertices.length > 2
      @contract()
    @edges.length

  removeCircularEdges: ->
    for i in [@edges.length - 1..0] by -1
      edge = @edges[i]
      if edge[0] is edge[1]
        @edges.splice i, 1

  addEdge: (u,v) ->
    edge = if u < v then [u,v] else [v,u]
    @edges.push edge
    @insertVertex u
    @insertVertex v

  insertVertex: (v) ->
    @vertices.push v if @vertices.indexOf(v) is -1

  removeParallelEdges: ->
    edges = {}
    for edge in @edges
      edges["#{edge[0]},#{edge[1]}"] = edge
    @edges = (x.split(",").map((x) -> parseInt(x, 10)) for x of edges)
    true

graphFromAdjacencyList = (adjencyListString, removeParallelEdges=true) ->
  lines = adjencyListString.split('\n')
  graph = new Graph

  for line in lines
    if line.trim()
      points = (parseInt(x, 10) for x in line.split(/\W/) when x)
      node = points.shift()
      for other in points
        graph.addEdge node, other

  if removeParallelEdges
    graph.removeParallelEdges()

  graph

module.exports = { Graph, graphFromAdjacencyList }

