quickSort = (arr, leftIndex, rightIndex) ->
  if rightIndex - leftIndex < 2
    return false

  pivotIndex = medianOfThree arr, leftIndex, rightIndex - 1
  [arr[leftIndex], arr[pivotIndex]] = [arr[pivotIndex], arr[leftIndex]]

  newPivotIndex = partition(arr, leftIndex, rightIndex)

  quickSort(arr, leftIndex, newPivotIndex)
  quickSort(arr, newPivotIndex+1, rightIndex)

partition = (arr, left, right) ->
  pivot = arr[left]
  pivotBoundary = seenUnseenBoundary = left + 1

  while seenUnseenBoundary < right
    if arr[seenUnseenBoundary] < pivot
      [arr[seenUnseenBoundary], arr[pivotBoundary]] = [arr[pivotBoundary], arr[seenUnseenBoundary]]
      pivotBoundary++
    seenUnseenBoundary++

  [arr[left], arr[pivotBoundary-1]] = [arr[pivotBoundary-1], arr[left]]

  pivotBoundary-1

medianOfThree = (arr, left, right) ->
  midIndex = middleIndex arr, left, right

  if (arr[left] < arr[midIndex] < arr[right]) or (arr[right] < arr[midIndex] < arr[left])
    return midIndex
  if (arr[midIndex] < arr[left] < arr[right]) or (arr[right] < arr[left] < arr[midIndex])
    return left
  return right

middleIndex = (arr, left, right) ->
  length = right + 1 - left
  if (length % 2) is 0
    midIndex = left - 1 + length/2
  else
    midIndex = left - 1 + Math.ceil(length/2)

exports = {
  quickSort,
  partition,
  medianOfThree,
  middleIndex
}

module.exports = exports

