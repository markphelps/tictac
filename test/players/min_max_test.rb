require 'test_helper'
require 'tictac/board'
require 'tictac/players/min_max'

module Tictac
  module Players
    class MinMaxTest < MiniTest::Test
      def setup
        @ui = UI.new
        @board = Board.new
        @player = MinMax.new('X', @ui)
      end

      def test_move
        @player.stub :minmax, 10 do
          @player.stub :best_choice, 5 do
            @ui.stub :thinking, true do
              @player.move(@board)
              assert_equal('X', @board.spaces[5])
            end
          end
        end
      end

      def test_minmax
        @player.stub :game_over?, true do
          @player.stub :score, 10 do
            assert_equal(10, @player.minmax(@board, 'X'))
          end
        end

        # TODO: Test Recurrsion
      end

      def test_game_over?
        @board.stub :winner, true do
          assert(@player.game_over?(@board))
        end

        @board.stub :tie?, true do
          assert(@player.game_over?(@board))
        end

        @board.stub :winner, false do
          refute(@player.game_over?(@board))
        end

        @board.stub :tie?, false do
          refute(@player.game_over?(@board))
        end
      end

      def test_best_move
        scores = { 0 => 10, 1 => -10, 2 => 0 }
        assert_equal([0, 10], @player.best_move('X', scores))
        assert_equal([1, -10], @player.best_move('O', scores))
      end

      def test_score
        @board.stub :winner, 'X' do
          assert_equal(10, @player.score(@board))
        end

        @board.stub :winner, 'O' do
          assert_equal(-10, @player.score(@board))
        end

        assert_equal(0, @player.score(@board))
      end

      def test_switch
        assert_equal('O', @player.switch('X'))
        assert_equal('X', @player.switch('O'))
      end
    end
  end
end
