mergeSorted = (left, right) ->
  index1 = index2 = 0
  merged = []
  while index1 + index2 < left.length + right.length
    if index1 < left.length and left[index1] < right[index2] or index2 >= right.length
      merged.push left[index1++]
    else
      merged.push right[index2++]
  return merged

mergeSort = (array, length) ->
  if length < 2
    return array

  leftHalf = array.slice(0, length/2)
  rightHalf = array.slice(length/2, length)

  left = mergeSort(leftHalf, leftHalf.length)
  right = mergeSort(rightHalf, rightHalf.length)
  return mergeSorted(left, right)

