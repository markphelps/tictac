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

      def test_next_move
        @player.stub :first_move?, true do
          # should call opening_move and return center
          assert_equal Computer::CENTER, @player.next_move
        end

        @player.stub :try_winning_move, 1 do
          assert_equal 1, @player.next_move
        end

        @player.stub :try_winning_move, 2 do
          assert_equal 2, @player.next_move
        end

        @player.stub :try_until_available, 8 do
          assert_equal 8, @player.next_move
        end
      end

      def test_try_winning_move
        @board.stub :tiles, ['O','O',nil] do
          assert_equal 2, @player.try_winning_move('O')
        end
        @board.stub :tiles, ['O','O','O'] do
          refute @player.try_winning_move('O')
        end
        @board.stub :tiles, ['O','X', nil] do
          refute @player.try_winning_move('O')
        end
      end

      def test_first_move?
        @board.stub :moves, 2 do
          refute @player.first_move?
        end
        @board.stub :moves, 1 do
          assert @player.first_move?
        end
      end

      def test_opening_move
        @board.stub :space_available?, true do
          assert_equal Computer::CENTER, @player.opening_move
        end

        @board.stub :space_available?, false do
          @player.stub :try_until_available, 1 do
            assert_equal 1, @player.opening_move
          end
        end
      end

      def test_random_corner
        assert Computer::CORNERS.include? @player.random_corner
      end

      def test_random_space
        assert (0..9).include? @player.random_space
      end

      def test_try_until_available
        @board.stub :tiles, [1,2,3,nil] do
          assert_equal 3, @player.try_until_available { rand(4) }
        end
      end
    end
  end
end
