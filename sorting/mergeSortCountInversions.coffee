mergeSortedAndCountSplitInversions = (left, right) ->
  splitInversions = 0
  index1 = index2 = 0
  merged = []
  while index1 + index2 < left.length + right.length
    if index1 < left.length and left[index1] < right[index2] or index2 >= right.length
      merged.push left[index1++]
    else
      merged.push right[index2++]
      splitInversions = splitInversions + (left.length - index1)
  return [merged, splitInversions]

sortAndCount = (array, length) ->
  if length < 2
    return [array, 0]

  leftHalf = array.slice(0, length/2)
  rightHalf = array.slice(length/2, length)

  [left, leftInversions] = sortAndCount(leftHalf, leftHalf.length)
  [right, rightInversions] = sortAndCount(rightHalf, rightHalf.length)
  [sorted, splitInversions] = mergeSortedAndCountSplitInversions(left, right)

  return [sorted, leftInversions + rightInversions + splitInversions]

