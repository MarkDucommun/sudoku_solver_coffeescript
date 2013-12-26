_ = require('underscore')._

class Sudoku
  constructor: (puzzleString) ->
    this.puzzle = _.map puzzleString.split(''), (a) ->
      parseInt(a)

  position: (i) ->
    this.puzzle[i]

  solved: ->
    that = this
    _.map [0..8], (i) ->
      return false unless that.setSolved that.getSet i, that.rowIndex
    true

  setSolved: (set) ->
    _.reduce( set, (memo, num) -> return memo + num; 0 ) == 45

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

module.exports = Sudoku