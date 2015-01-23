require 'tictac/player'

module Tictac
  module Players
    class Computer < Tictac::Player

      # [0][1][2]
      # [3][4][5]
      # [6][7][8]

      # All spaces on board that will win
      WINNING_SPACES = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

      # Order in which we should check for wins
      WINNING_PRIORITIES = [[0, 1, 2], [0, 2, 1], [1, 2, 0]]

      def initialize(board)
        super('O', board)
      end

      def winning_move(player)
        WINNING_SPACES.each do |space|
          WINNING_PRIORITIES.each do |priority|
            # If player is in 2 of 3 winning spaces
            if (@board.tiles[space[priority[0]]] == player) && (@board.tiles[space[priority[1]]] == player)
              # Check if final winning space is available
              next_space = space[priority[2]]
              if @board.space_available? next_space
                return next_space
              end
            end
          end
        end
        return nil
      end

      def random_move
        while true do
          random_space = rand(8)
          if @board.space_available? random_space
            return random_space
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