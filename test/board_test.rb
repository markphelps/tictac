require 'test_helper'
require 'tictac/board'

module Tictac
  class BoardTest < MiniTest::Test

    TILES = [1,2,3,4,5,6,7,8,9]

    def setup
      @board = Board.new
    end

    def test_moves
      @board.stub :tiles, TILES do
        assert_equal 9, @board.moves
      end
      @board.stub :tiles, [nil, 1] do
        assert_equal 1, @board.moves
      end
    end

    def test_row
      @board.stub :tiles, TILES do
        assert_equal [1,2,3], @board.row(0)
        assert_equal [4,5,6], @board.row(1)
        assert_equal [7,8,9], @board.row(2)
      end
    end

    def test_column
      @board.stub :tiles, TILES do
        assert_equal [1,4,7], @board.column(0)
        assert_equal [2,5,8], @board.column(1)
        assert_equal [3,6,9], @board.column(2)
      end
    end

    def test_rows
      @board.stub :tiles, TILES do
        assert_equal [[1,2,3], [4,5,6], [7,8,9]], @board.rows
      end
    end

    def test_columns
      @board.stub :tiles, TILES do
        assert_equal [[1,4,7], [2,5,8], [3,6,9]], @board.columns
      end
    end

    def test_diagonals
      @board.stub :tiles, TILES do
        assert_equal [[1,5,9], [7,5,3]], @board.diagonals
      end
    end
  end
end