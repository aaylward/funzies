fs = require 'fs'
{ minCut } = require '../graphs/minCut.coffee'

permutedSmallGraph = fs.readFileSync('test/data/lilcut2.txt').toString()
smallSparseGraph = fs.readFileSync('test/data/lilcut.txt').toString()
otherSmallGraph = fs.readFileSync('test/data/lilcut3.txt').toString()

exports.MinCut =
  'should find the minimum cut of a smallish pretty sparse graph': (test) ->
    test.expect 1
    test.ok minCut(smallSparseGraph) is 2
    test.done()

  'should find the minimum cut of a permutation of the same smallish pretty sparse graph': (test) ->
    test.expect 1
    test.ok minCut(permutedSmallGraph) is 2
    test.done()

  'should find the minimum cut of a different smallish pretty sparse graph': (test) ->
    test.expect 1
    test.ok minCut(otherSmallGraph) is 1
    test.done()

