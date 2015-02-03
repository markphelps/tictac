require 'test_helper'
require 'tictac/board'
require 'tictac/players/human'

module Tictac
  module Players
    class HumanTest < MiniTest::Test

      def setup
        @board = Board.new
        @player = Human.new @board
      end

      def test_marker
        assert_equal 'X', @player.marker
      end

      def test_next_move
        @player.stub :get_move, 5 do
          @player.stub :should_quit?, false do
            @player.stub :validate, true do
              assert_equal 5, @player.next_move
            end
          end
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
          refute @player.validate('')
        end
        assert_match %r%invalid%i, out

        out, err = capture_io do
          refute @player.validate('-1')
        end
        assert_match %r%invalid%i, out

        @board.stub :tiles, [1,2] do
          out, err = capture_io do
            refute @player.validate('1')
          end
          assert_match %r%invalid%i, out
        end

        assert @player.validate '1'
      end
    end
  end
end