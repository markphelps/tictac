require 'tictac/player'

module Tictac
  module Players
    class Human < Tictac::Player

      def move(board)
        valid = false

        until valid
          input = get_move
          quit if should_quit? input
          valid = validate input, board
        end

        board.place_piece input.to_i, piece
      end

      def should_quit?(input)
        input =~ /q/i
      end

      def validate(input, board)
        valid = !input.empty? && board.valid_move?(input.to_i)
        invalid_input unless valid
        valid
      end

      private

      def method_missing(method, *args)
        UI.send(method, *args)
      end
    end
  end
end