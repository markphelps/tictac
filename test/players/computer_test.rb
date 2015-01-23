require 'test_helper'
require 'tictac/board'
require 'tictac/players/computer'

module Tictac
  module Players
    class ComputerTest < MiniTest::Test

      def setup
        @board = Board.new
        @player = Computer.new @board
      end

      def test_marker
        assert_equal 'O', @player.marker
      end

      def test_winning_move
        @board.stub :tiles, ['O','O',nil] do
          assert_equal 2, @player.winning_move('O')
        end
        @board.stub :tiles, ['O','O','O'] do
          refute @player.winning_move('O')
        end
        @board.stub :tiles, ['O','X', nil] do
          refute @player.winning_move('O')
        end
      end

      def test_random_move
        @board.stub :tiles, [1,2,3,nil,nil,6,nil,8,9] do
          refute_nil @player.random_move
        end
      end

      def test_next_move
        @player.stub :winning_move, 1 do
          assert_equal 1, @player.next_move
        end

        @player.stub :winning_move, 2 do
          assert_equal 2, @player.next_move
        end

        @player.stub :random_move, 8 do
          assert_equal 8, @player.next_move
        end
      end
    end
  end
end
