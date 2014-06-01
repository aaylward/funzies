{ quickSort, partition, medianOfThree, middleIndex } = require 'sorting/quickSort.coffee'
fs = require 'fs'

inputStrings =
  10   : fs.readFileSync('test/data/10.txt').toString().split('\r\n')
  100  : fs.readFileSync('test/data/100.txt').toString().split('\r\n')
  1000 : fs.readFileSync('test/data/1000.txt').toString().split('\r\n')

inputs = {}

for k, v of inputStrings
  inputs["#{ k }"] = []
  inputs["#{ k }copy"] = []

  for maybeNum in v
    num = parseInt maybeNum
    if num is num
      inputs["#{ k }"].push num
      inputs["#{ k }copy"].push num


exports.QuickSort =
  'should sort correctly on multiple test inputs': (test) ->
    test.expect 9
    for key of inputStrings
      test.deepEqual inputs["#{ key }"], inputs["#{ key }copy"]
      quickSort inputs["#{ key }"], 0, inputs["#{ key }"].length - 1
      test.notDeepEqual inputs["#{ key }"], inputs["#{ key }copy"]
      inputs["#{ key }copy"].sort (a,b) -> a-b
      test.deepEqual inputs["#{ key }"], inputs["#{ key }copy"]

    test.done()
    

exports.Partition =
  'should partition an array of even size around its first element': (test) ->
    
    test.expect 1
    input = [3,1,6,0,2,4,7,5]
    pivotPoint = partition input, 0, 8
    test.ok input[3] is 3
    test.done()

  'should also partition this other array': (test) ->

    test.expect 1
    input2 = [3,1,9,4,0,5,2,8,7,6]
    pivotPoint2 = partition input2, 0, input2.length - 1
    test.ok input2[3] is 3
    test.done()


exports.MedianOfThree =
  'should pick the index of the median of [first, middle, last] in an array': (test) ->
    evenInput = [4,5,6,7]
    oddInput = [4,5,6,7,8]
    scrambledInput = [3,1,-4,19,8]

    test.expect 3

    test.ok medianOfThree(evenInput, 0, evenInput.length - 1) is 1
    test.ok medianOfThree(oddInput, 0, oddInput.length - 1) is 2
    test.ok medianOfThree(scrambledInput, 0, scrambledInput.length - 1) is 0
    test.done()


exports.MiddleIndex =
  'should return k - 1 for arrays of length 2k': (test) ->
    test.expect 1
    test.ok middleIndex([0,1,2,3], 0, 3) is 1
    test.done()

  'should return k for arrays of length 2k + 1': (test) ->
    test.expect 1
    test.ok middleIndex([0,1,2,3,4], 0, 4) is 2
    test.done()

  'should work with scrambled input': (test) ->
    scrambledInput = [3,1,-4,19,8]
    test.expect 1
    test.ok middleIndex(scrambledInput, 0, scrambledInput.length) is 2
    test.done()

