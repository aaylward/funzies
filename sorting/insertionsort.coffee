insertionSort = (items) ->
  return items if items.length < 2

  for i in [1...items.length]
    j = i
    while j > 0 and items[j] < items[j-1]
      [items[j-1], items[j]] = [items[j], items[j-1]]
      j--

