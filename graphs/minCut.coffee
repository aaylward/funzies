{ graphFromAdjacencyList } = require './graph.coffee'

minCut = (listRepr) ->
  # naive implementation
  # probability of success is (1 - 1/size)
  size = listRepr.split('\n').length
  cutsLeft = (size**2)*Math.log(size)
  cuts = []

  while --cutsLeft > 0
    graph = graphFromAdjacencyList listRepr
    cuts.push graph.kargerRandomCut()

  Math.min(cuts...)

module.exports = { minCut }

