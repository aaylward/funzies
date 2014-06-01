{ partition, medianOfThree } = require '../sorting/quicksort.coffee'

quickSelect = (arr, startIndex, endIndex, n) ->
  relativeOffset = n + startIndex
  if endIndex < relativeOffset
    return arr[startIndex]

  pivotIndex = medianOfThree arr, startIndex, endIndex
  [arr[startIndex], arr[pivotIndex]] = [arr[pivotIndex], arr[startIndex]]

  newPivotIndex = partition(arr, startIndex, endIndex)

  if newPivotIndex is relativeOffset
    return arr[newPivotIndex]

  if relativeOffset < newPivotIndex
    return quickSelect(arr, startIndex, newPivotIndex - 1, n)

  return quickSelect(arr, newPivotIndex + 1, endIndex, relativeOffset - newPivotIndex - 1)

module.exports = { quickSelect }


