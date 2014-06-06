{ graphFromAdjacencyList } = require './graph.coffee'

minCut = (listRepr) ->
  # naive implementation
  # probability of success is (1 - 1/size)
  size = listRepr.split('\n').length
  cutsLeft = (size**2)*Math.log(size)
  min = undefined

  while --cutsLeft > 0
    graph = graphFromAdjacencyList listRepr
    if min is undefined
      min = graph.kargerRandomCut()
    else
      min = Math.min(min, graph.kargerRandomCut())

  min

module.exports = { minCut }

