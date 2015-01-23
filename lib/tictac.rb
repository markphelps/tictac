require 'tictac/version'
require 'tictac/game_state'
require 'colorize'

module Tictac
  class Game

    def initialize
      @game = GameState.new
    end

    def run
      usage

      while true
        puts
        puts @game.board

        @player = @game.next_player

        puts "\nPlayer #{@player}'s turn".yellow

        @player.move

        won if @player.winner?
        tie if @game.tie?
      end
    end

    private

    def won
      quit { "\nPlayer #{@player} WINS!".green }
    end

    def tie
      quit { "\nIt's a DRAW!".yellow }
    end

    def quit
      puts yield
      puts
      puts @game.board
      abort
    end

    def usage
      puts %q[
      ___________ .__        __
      \__    ___/ |__| _____/  |______    ____
         |    |   |  |/ ___\   __\__  \ _/ ___\
         |    |   |  \  \___|  |  / __ \  \___
         |____|   |__|\___  >__| (____  /\___  >
                          \/          \/     \/].green

      puts "Lets play Tic Tac Toe!"
      puts "\nEnter the coordinates for where you want to move".yellow
      puts "Ex: '0' would move you to the 1st column, 1st row"
      puts "\nPress 'q' to Quit"
    end
  end
end
