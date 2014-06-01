{ quickSelect } = require 'selection/quickSelect.coffee'

tests = {}
i = 0
while i < 10
  tests["should select the #{i}th indexed element from a scrambled array"] = ((j) ->
    (t) ->
      t.expect 1
      array = [3,1,9,4,0,5,2,8,7,6]
      jthEl = quickSelect(array, 0, array.length - 1, j)
      t.ok jthEl is j
      t.done()

  )(i++)
    
exports.QuickSelect = tests

