require 'tictac/player'
require 'tictac/ui'

module Tictac
  module Players
    class Human < Tictac::Player

      def move(board)
        valid = false

        until valid
          input = ui.get_move
          ui.quit if should_quit? input
          valid = validate input, board
        end

        board.place_piece input.to_i, piece
      end

      def should_quit?(input)
        input =~ /q/i
      end

      def validate(input, board)
        valid = !input.empty? && board.valid_move?(input.to_i)
        ui.invalid_input unless valid
        valid
      end
    end
  end
end