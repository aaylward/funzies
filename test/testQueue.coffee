{ Queue } = require '../ds/queue.coffee'

module.exports.Queue =
  'should be empty when you make it': (test) ->
    test.expect 2

    q = new Queue

    test.ok q.isEmpty()
    test.ok q.size() is 0

    test.done()

  'should contain the things we insert in the order we insert them': (test) ->

    stuff = ['abc', 42, 'apples', 'boats', 100, +new Date]
    q = new Queue

    test.expect 2 + stuff.length

    for itm in stuff
      q.enqueue itm

    test.ok q.size() is stuff.length

    idx = 0
    while item = q.dequeue()
      test.ok item is stuff[idx++]

    test.ok q.isEmpty()

    test.done()

  'should allow peeking at the next item to be dequeued': (test) ->
    test.expect 2

    q = new Queue
    q.enqueue 'hi!'
    q.enqueue 'bye!'

    size = q.size()

    itm = q.peek()

    test.ok itm is 'hi!'
    test.ok size is q.size()

    test.done()

  'should allow adding a bunch of stuff and then removing it': (test) ->
    LIMIT = 2000
    test.expect 3 * LIMIT

    q = new Queue

    i = 0

    while i < LIMIT
      q.enqueue i
      test.ok q.size() is ++i

    j = 0

    while (peeked=q.peek()) isnt undefined
      test.ok j is peeked
      test.ok q.dequeue() is j++

    test.done()

  'should compact when half of it is empty': (test) ->
    LIMIT = 1000

    test.expect LIMIT + 3
    q = new Queue

    i = 0
    while i < LIMIT
      q.enqueue i++

    test.ok q.size() is LIMIT
    test.ok q.items.length is LIMIT

    j = 0
    while j++ < LIMIT/2 - 1
      q.dequeue()
      test.ok q.size() is LIMIT - j
      test.ok q.items.length is LIMIT

    peek = q.peek()
    itm = q.dequeue()
    test.ok itm is LIMIT/2 - 1
    test.ok itm is peek
    test.ok q.size() is q.items.length

    test.done()

