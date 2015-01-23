require 'test_helper'
require 'tictac/player'

module Tictac
  class PlayerTest < MiniTest::Test

    def setup
      @board = Board.new
      @player = Player.new 'X', @board
    end

    def test_move
      @player.stub :next_move, 3 do
         @player.move
         assert_equal @player.marker, @board.tiles[3]
      end
    end

    def test_winner?
      @board.stub :columns, [[@player.marker]] do
        assert @player.winner?
      end

      @board.stub :columns, [['']] do
        refute @player.winner?
      end
    end
  end
end