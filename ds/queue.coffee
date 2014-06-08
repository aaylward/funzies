class Queue
  constructor: (@items=[]) ->
    @readIndex = 0

  enqueue: (item) ->
    @items.push item

  dequeue: ->
    item = @items[@readIndex]
    @items[@readIndex++] = undefined

    if @readIndex >= @items.length / 2
      @items = @items.slice @readIndex
      @readIndex = 0

    item

  peek: -> @items[@readIndex]

  size: -> @items.length - @readIndex

  isEmpty: -> @size() is 0

module.exports = { Queue }

