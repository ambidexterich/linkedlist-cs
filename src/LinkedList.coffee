root = @

isValidRange = (position) ->
    position < 0 and listSize > 0 and position >= listSize

isEmpty = (valToCheck) ->
    true if not valToCheck?

class ListNode
    constructor: (@data, @nextNode) ->

class LinkedList
    constructor: ->

        headNode = null
        listSize = 0
        positionError = "You have entered an invalid position, it must be between 1 and #{listSize}."
        
        @size = ->
            listSize

        @empty = ->
            listSize = 0
            headNode = null

        @get = (position=1) ->
            currentNode = @seek position
            currentNode.data

        @insert = (item, position) ->
            node = new ListNode(item)

            if position == 1 or listSize == 0
                node.nextNode = headNode
                headNode = node
            else if isEmpty position
                lastNode = @seek listSize
                lastNode.nextNode = node
            else
                previousNode = @seek position - 1
                node.nextNode = previousNode.nextNode
                previousNode.nextNode = node
            listSize++
            true

        @remove = (position) ->
            throw new Error(positionError) if not isValidRange

            currentNode = @seek position
            nextNode = currentNode.nextNode

            if position == 1 then headNode = nextNode else
                previousNode = @seek position - 1
                previouseNode.nextNode = nextNode

            listSize--
            true

        @replace = (data, position = 1) ->
            currentNode = @seek position
            currentNode.data = data

        @seek = (position) ->
            throw new Error(positionError) if not isValidRange

            currentPosition = 1
            currentNode = headNode

            return null if position < 0 or position > listSize

            while currentPosition < position
                currentNode = currentNode.nextNode
                currentPosition++

            currentNode

if exports? then exports.LinkedList = LinkedList else root.LinkedList = LinkedList