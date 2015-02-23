require 'test_helper'
require 'tictac/board'
require 'tictac/players/human'

module Tictac
  module Players
    class HumanTest < MiniTest::Test

      def setup
        @ui = UI.new
        @board = Board.new
        @player = Human.new 'X', @ui
      end

      def test_piece
        assert_equal 'X', @player.piece
      end

      def test_move
        @ui.stub :get_move, '1' do
          @player.move @board
          assert_equal @player.piece, @board.spaces[1]
        end
      end

      def test_should_quit?
        assert @player.should_quit? 'q'
        assert @player.should_quit? 'Q'
        assert @player.should_quit? 'q  '
        refute @player.should_quit? '1'
        refute @player.should_quit? 'X'
      end

      def test_validate
        out, err = capture_io do
          refute @player.validate '', @board
        end
        assert_match %r%invalid%i, out

        out, err = capture_io do
          refute @player.validate '-1', @board
        end
        assert_match %r%invalid%i, out

        @board.stub :spaces, [1,2] do
          out, err = capture_io do
            refute @player.validate '1', @board
          end
          assert_match %r%invalid%i, out
        end

        assert @player.validate '1', @board
      end
    end
  end
end