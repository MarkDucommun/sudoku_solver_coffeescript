_ = require('underscore')._
Sudoku = require '../sudoku'

unsolved =
  '619030040270061008000047621486302079000014580031009060005720806320106057160400030'
solved =
  '619238745274561398853947621486352179792614583531879264945723816328196457167485932'

describe 'a new Sudoku game', ->
  it 'reads a puzzle string where unfilled spaces are zeros', ->
    sudoku = new Sudoku unsolved
    expect( sudoku.position 3 ).toBe 0

  it 'can tell if the puzzle is solved', ->
    sudoku = new Sudoku solved
    expect( sudoku.solved() ).toBe true

  it 'can tell if a set is solved', ->
    sudoku = new Sudoku solved
    expect( sudoku.setSolved [6, 1, 9, 2, 3, 8, 7, 4, 5] ).toBe true

  it 'can get a specified row', ->
    sudoku = new Sudoku unsolved
    expected = [6, 1, 9, 0, 3, 0, 0, 4, 0]
    row = sudoku.getSet 0, sudoku.rowIndex
    _.each expected, (a, i) ->
      expect( row[i] ).toBe a

  it 'can get a specified column', ->
    sudoku = new Sudoku unsolved
    expected = [6, 2, 0, 4, 0, 0, 0, 3, 1]
    column = sudoku.getSet 0, sudoku.columnIndex
    _.each expected, (a, i) ->
      expect( column[i] ).toBe a

  it 'can get a specified box', ->
    sudoku = new Sudoku unsolved
    expected = [6, 1, 9, 2, 7, 0, 0, 0, 0]
    box = sudoku.getSet 0, sudoku.boxIndex
    _.each expected, (a, i) ->
      expect( box[i] ).toBe a

  it 'can get an entries row index', ->
    sudoku = new Sudoku '0'
    expect( sudoku.rowIndex 9 ).toBe 1

  it 'can get an entries column index', ->
    sudoku = new Sudoku '0'
    expect( sudoku.columnIndex 9 ).toBe 0

  it 'can get an entries box index', ->
    sudoku = new Sudoku '0'
    expect( sudoku.boxIndex 5 ).toBe 1

  it 'can guess the first unsolved entry', ->
    sudoku = new Sudoku unsolved