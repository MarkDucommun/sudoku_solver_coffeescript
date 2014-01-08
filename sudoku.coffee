_ = require('underscore')._

class Sudoku
  constructor: (puzzleString) ->
    this.puzzle = _.map puzzleString.split(''), (a) ->
      parseInt(a)

  position: (i) ->
    this.puzzle[i]

  solved: ->
    that = this
    result = true
    _.map [0..8], (i) ->
      result = false unless that.setSolved( that.getSet( i, that.rowIndex ) )
      result = false unless that.setSolved( that.getSet( i, that.columnIndex ) )
      result = false unless that.setSolved( that.getSet( i, that.boxIndex ) )
    result

  setSolved: (set) ->
    _.reduce( set, (memo, num) -> return memo + num ) == 45

  getSet: (index, indexFunction) ->
    _.select this.puzzle, (a, i) ->
      index == indexFunction i

  rowIndex: (i) ->
    Math.floor i / 9

  columnIndex: (i) ->
    i % 9

  boxIndex: (i) ->
    boxRow = Math.floor Math.floor( i / 9 ) / 3
    boxColumn = Math.floor i % 9 / 3
    boxRow * 3 + boxColumn

  solve: ->
    index = do this.firstUnsolvedIndex

  firstUnsolvedIndex: ->
    result = false
    _.each this.puzzle, (a, i) ->
      result = i if !result && a == 0
    result

  eliminate_possibilities: (index) ->

  getSets: (index) ->


module.exports = Sudoku