// Generated by CoffeeScript 1.6.3
(function() {
  var Sudoku, solved, unsolved, _;

  _ = require('underscore')._;

  Sudoku = require('../sudoku');

  unsolved = new Sudoku('619030040270061008000047621486302079000014580031009060005720806320106057160400030');

  solved = new Sudoku('619238745274561398853947621486352179792614583531879264945723816328196457167485932');

  describe('a new Sudoku game', function() {
    it('reads a puzzle string where unfilled spaces are zeros', function() {
      return expect(unsolved.position(3)).toBe(0);
    });
    it('can tell if the puzzle is solved', function() {
      return expect(solved.solved()).toBe(true);
    });
    it('can tell if the puzzle is unsolved', function() {
      return expect(unsolved.solved()).toBe(false);
    });
    it('can tell if a set is solved', function() {
      return expect(solved.setSolved([6, 1, 9, 2, 3, 8, 7, 4, 5])).toBe(true);
    });
    it('can get a specified row', function() {
      var expected, row;
      expected = [6, 1, 9, 0, 3, 0, 0, 4, 0];
      row = unsolved.getSet(0, unsolved.rowIndex);
      return _.each(expected, function(a, i) {
        return expect(row[i]).toBe(a);
      });
    });
    it('can get a specified column', function() {
      var column, expected;
      expected = [6, 2, 0, 4, 0, 0, 0, 3, 1];
      column = unsolved.getSet(0, unsolved.columnIndex);
      return _.each(expected, function(a, i) {
        return expect(column[i]).toBe(a);
      });
    });
    it('can get a specified box', function() {
      var box, expected;
      expected = [6, 1, 9, 2, 7, 0, 0, 0, 0];
      box = unsolved.getSet(0, unsolved.boxIndex);
      return _.each(expected, function(a, i) {
        return expect(box[i]).toBe(a);
      });
    });
    it('can get an entries row index', function() {
      return expect(unsolved.rowIndex(9)).toBe(1);
    });
    it('can get an entries column index', function() {
      return expect(unsolved.columnIndex(9)).toBe(0);
    });
    it('can get an entries box index', function() {
      return expect(unsolved.boxIndex(5)).toBe(1);
    });
    it('can locate the first unsolved entry in the puzzle', function() {
      return expect(unsolved.firstUnsolvedIndex()).toBe(3);
    });
    it('can get the 3 sets an entry belongs to except that entry', function() {
      var expected, sets;
      expected = [1, 2, 3, 4, 6, 7, 9];
      sets = unsolved.getSets(18);
      return _.each(expected, function(a, i) {
        return expect(sets[i] = a);
      });
    });
    return it('can get only the final etnries of a set', function() {
      var expected, set;
      expected = [6, 2, 4, 3, 1];
      set = unsolved.getSet(0, unsolved.columnIndex, true);
      return _.each(expected, function(a, i) {
        return expect(set[i] = a);
      });
    });
  });

}).call(this);
