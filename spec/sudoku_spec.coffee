_ = require('underscore')._
Sudoku = require '../sudoku'

unsolved = new Sudoku '619030040270061008000047621486302079000014580031009060005720806320106057160400030'
solved = new Sudoku '619238745274561398853947621486352179792614583531879264945723816328196457167485932'

describe 'a new Sudoku game', ->
  it 'reads a puzzle string where unfilled spaces are zeros', ->
    expect( unsolved.position 3 ).toBe 0

  it 'can tell if the puzzle is solved', ->
    expect( do solved.solved ).toBe true

  it 'can tell if the puzzle is unsolved', ->
    expect( do unsolved.solved ).toBe false

  it 'can tell if a set is solved', ->
    expect( solved.setSolved [6, 1, 9, 2, 3, 8, 7, 4, 5] ).toBe true

  it 'can get a specified row', ->
    expected = [6, 1, 9, 0, 3, 0, 0, 4, 0]
    row = unsolved.getSet( 0, unsolved.rowIndex )
    _.each expected, (a, i) ->
      expect( row[i] ).toBe a

  it 'can get a specified column', ->
    expected = [6, 2, 0, 4, 0, 0, 0, 3, 1]
    column = unsolved.getSet( 0, unsolved.columnIndex )
    _.each expected, (a, i) ->
      expect( column[i] ).toBe a

  it 'can get a specified box', ->
    expected = [6, 1, 9, 2, 7, 0, 0, 0, 0]
    box = unsolved.getSet( 0, unsolved.boxIndex )
    _.each expected, (a, i) ->
      expect( box[i] ).toBe a

  it 'can get an entries row index', ->
    expect( unsolved.rowIndex 9 ).toBe 1

  it 'can get an entries column index', ->
    expect( unsolved.columnIndex 9 ).toBe 0

  it 'can get an entries box index', ->
    expect( unsolved.boxIndex 5 ).toBe 1

  # it 'can solve the puzzle', ->
  #   sudoku = new Sudoku unsolved
  #   do sudoku.solve
  #   _.each solved, (a, i) ->
  #     expect( sudoku.position i ).toBe parseInt a

  it 'can locate the first unsolved entry in the puzzle', ->
    expect( do unsolved.firstUnsolvedIndex ).toBe 3

  # it 'can eliminate the numbers that are not possible', ->
  #   expected = [5, 8]
  #   possibilities = unsolved.eliminate_possiblities 18
  #   _.each expected, (a, i) ->
  #     expect( possibilities[i] ).toBe a

  it 'can get the 3 sets an entry belongs to except that entry', ->
    expected = [1,2,3,4,6,7,9]
    sets = unsolved.getSets 18
    _.each expected, (a, i) ->
      expect( sets[i] = a )

  it 'can get only the final etnries of a set', ->
    expected = [6, 2, 4, 3, 1]
    set = unsolved.getSet( 0, unsolved.columnIndex, true )
    _.each expected, (a, i) ->
      expect( set[i] = a )