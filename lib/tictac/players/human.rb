require 'tictac/player'
require 'colorize'

module Tictac
  module Players
    class Human < Tictac::Player

      def initialize(board)
        super('X', board)
      end

      def next_move
        valid = false

        while !valid
          input = get_move

          quit if should_quit? input
          valid = validate input
        end

        input.to_i
      end

      def get_move
        puts "Where to move?: "
        gets.chomp
      end

      def should_quit?(input)
        input =~ /q/i
      end

      def validate(input)
        valid = (0..8).include?(input.to_i) && @board.tiles[input.to_i].nil?
        puts "\nInvalid input.. please try again.".red unless valid
        valid
      end

      def quit
        puts "\nThanks for playing!".green
        abort
      end
    end
  end
end