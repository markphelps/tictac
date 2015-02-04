require 'colorize'

module Tictac
  class UI
    class << self

      def banner
        puts %q[
        ___________ .__        __
        \__    ___/ |__| _____/  |______    ____
           |    |   |  |/ ___\   __\__  \ _/ ___\
           |    |   |  \  \___|  |  / __ \  \___
           |____|   |__|\___  >__| (____  /\___  >
                            \/          \/     \/].green
        puts "Lets play Tic Tac Toe!"
      end

      def usage
        puts "\nEnter the coordinates for where you want to move".yellow
        puts "Ex: '0' would move you to the 1st column, 1st row"
        puts "\nPress 'q' to Quit"
      end

      def turn(player)
        puts "\nPlayer #{player}'s turn".yellow
      end

      def won(player)
        puts "\nPlayer #{player} WINS!".green
      end

      def tie
        puts "\nIt's a DRAW!".yellow
      end

      def thinking(player)
        puts "\nPlayer #{player} is thinking..."
        sleep 2
      end

      def display_board(board)
        output = "\n"
        0.upto(8) do |position|
          output << " #{board.spaces[position] || position} "
          case position % 3
          when 0, 1 then output << "|"
          when 2 then output << "\n-----------\n" unless position == 8
          end
        end
        puts output
      end

      def get_move
        print "Where to move? : "
        gets.chomp
      end

      def invalid_input
        puts "\nInvalid input.. please try again.".red
      end

      def quit
        yield if block_given?
        puts "\nThanks for playing!".green
        abort
      end
    end
  end
end