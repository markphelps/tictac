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
          puts "Where to move?: "
          input = gets.chomp

          quit if should_quit? input
          valid = validate input
          puts "\nInvalid input.. please try again.".red unless valid
        end

        input.to_i
      end

      def should_quit?(input)
        input =~ /q/i
      end

      def validate(input)
        (0..8).include?(input.to_i) && @board.tiles[input.to_i].nil?
      end

      def quit
        puts "\nThanks for playing!".green
        abort
      end
    end
  end
end