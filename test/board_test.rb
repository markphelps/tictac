require 'test_helper'
require 'tictac/board'

module Tictac
  class BoardTest < MiniTest::Test

    SPACES = (1..9).to_a

    def setup
      @board = Board.new
    end

    def test_moves
      @board.stub :spaces, SPACES do
        assert_equal 9, @board.moves
      end

      @board.stub :spaces, [nil, 1] do
        assert_equal 1, @board.moves
      end
    end

    def test_place_piece
      @board.place_piece 0, 'X'
      assert_equal 'X', @board.spaces[0]
    end

    def test_valid_move?
      assert @board.valid_move? 0
      refute @board.valid_move? 10

      @board.stub :space_available?, false do
        refute @board.valid_move? 0
      end
    end

    def test_space_available?
      @board.stub :spaces, SPACES do
        refute @board.space_available? 0
      end

      @board.stub :spaces, [nil, 1] do
        assert @board.space_available? 0
      end
    end

    def test_available_spaces
      assert_equal 9, @board.available_spaces.size

      @board.stub :spaces, SPACES do
        assert_equal 0, @board.available_spaces.size
      end
    end

    def test_winning_combination
      @board.stub :spaces, ['X', 'X', 'X'] do
        assert_equal [0,1,2], @board.winning_combination
      end

      @board.stub :spaces, ['X', 'O', 'X'] do
        refute @board.winning_combination
      end

      @board.stub :spaces, ['X', 'O', nil] do
        refute @board.winning_combination
      end
    end

    def test_winner
      @board.stub :winning_combination, [0,1,2] do
        @board.stub :spaces, ['X', 'X', 'X'] do
          assert_equal 'X', @board.winner
        end
      end

      @board.stub :winning_combination, false do
        refute @board.winner
      end
    end

    def test_tie?
      @board.stub :available_spaces, [] do
        assert @board.tie?
      end

      @board.stub :available_spaces, [1] do
        refute @board.tie?
      end
    end
  end
end