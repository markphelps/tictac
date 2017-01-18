require 'tictac/version'
require 'tictac/players/min_max'
require 'tictac/players/human'
require 'tictac/board'
require 'tictac/ui'
require 'colorize'

trap("SIGINT") { exit! }

module Tictac
  class Game
    attr_reader :board, :human, :computer, :ui

    def initialize
      @ui = UI.new
      @board = Board.new
      @human = Players::Human.new('X', @ui)
      @computer = Players::MinMax.new('O', @ui)
    end

    def play
      ui.banner
      ui.usage

      ui.display_board(board)

      player, opponent = human, computer

      while true
        ui.turn(player)

        player.move(board)

        ui.display_board(board)

        ui.quit { ui.won(player) } if board.winner
        ui.quit { ui.tie } if board.tie?

        player, opponent = opponent, player
      end
    end
  end
end
