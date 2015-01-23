require 'tictac/board'
require 'tictac/players/human'
require 'tictac/players/computer'

module Tictac
  class GameState

    attr_reader :board, :players

    def initialize
      @board = Board.new
      @players ||= [ Tictac::Players::Human.new(@board), Tictac::Players::Computer.new(@board) ]
      @turn = @players.cycle # Enumerator to keep track of whose turn it is
    end

    def next_player
      @turn.next
    end

    def tie?
      board.tiles.compact.count == 9
    end
  end
end