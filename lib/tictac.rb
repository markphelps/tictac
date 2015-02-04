require 'tictac/version'
require 'tictac/players/min_max'
require 'tictac/players/human'
require 'tictac/board'
require 'tictac/ui'
require 'colorize'

module Tictac
  class Game

    attr_reader :board, :human, :computer

    def initialize
      @board = Board.new
      @human = Players::Human.new 'X'
      @computer = Players::MinMax.new 'O'
    end

    def play
      banner
      usage

      display_board board

      player, opponent = human, computer

      while true
        turn player

        thinking player if player == computer

        player.move board

        display_board board

        quit { won player } if board.winner
        quit { tie } if board.tie?

        player, opponent = opponent, player
      end
    end

    private

    def method_missing(method, *args)
      UI.send(method, *args)
    end
  end
end
