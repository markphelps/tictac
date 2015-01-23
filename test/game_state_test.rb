require 'test_helper'
require 'tictac/game_state'

module Tictac
  class GameStateTest < MiniTest::Test

    def setup
      @game = GameState.new
    end

    def test_next_player
      assert_same @game.players.first, @game.next_player
      assert_same @game.players.last, @game.next_player
      assert_same @game.players.first, @game.next_player
    end

    def test_tie?
      refute @game.tie?

      @game.board.stub :tiles, Array.new(8, "test") do
        refute @game.tie?
      end

      @game.board.stub :tiles, Array.new(9, "test") do
        assert @game.tie?
      end
    end
  end
end