require 'tictac/player'

module Tictac
  module Players
    class Computer < Tictac::Player

      WINNING_PLACES = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]
      WINNING_PRIORITIES = [[0, 1, 2], [0, 2, 1], [1, 2, 0]]

      def initialize(board)
        super('O', board)
      end

      def winning_move(player)
        WINNING_PLACES.each do |place|
          WINNING_PRIORITIES.each do |priority|
            # If player is in 2 of 3 winning places
            if (@board.tiles[place[priority[0]]] == player) && (@board.tiles[place[priority[1]]] == player)
              # Check if final winning place is available
              if @board.tiles[place[priority[2]]].nil?
                return place[priority[2]]
              end
            end
          end
        end
        return nil
      end

      def random_move
        while true do
          random_position = rand(8)
          if @board.tiles[random_position].nil?
            return random_position
          end
        end
      end

      def next_move
        # Check if I can win first, then if opponent, if not just make a random move
        winning_move('O') || winning_move('X')|| random_move
      end
    end
  end
end