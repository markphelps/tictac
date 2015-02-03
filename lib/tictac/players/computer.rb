require 'tictac/player'

module Tictac
  module Players
    class Computer < Tictac::Player

      # [0][1][2]
      # [3][4][5]
      # [6][7][8]

      CENTER = 4

      CORNERS = [0, 2, 6, 8]

      # All spaces on board that will win
      WINNING_SPACES = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

      # Order in which we should check for wins
      WINNING_PRIORITIES = [[0, 1, 2], [0, 2, 1], [1, 2, 0]]

      def initialize(board)
        super('O', board)
      end

      def next_move
        return opening_move if first_move?
        # Check if I can win first, then if opponent, if not just make a random move
        try_winning_move('O') || try_winning_move('X')|| try_until_available { random_space }
      end

      def try_winning_move(player)
        WINNING_SPACES.each do |space|
          WINNING_PRIORITIES.each do |priority|
            # If player is in 2 of 3 winning spaces
            if (@board.tiles[space[priority[0]]] == player) && (@board.tiles[space[priority[1]]] == player)
              # Check if final winning space is available
              next_space = space[priority[2]]
              return next_space if @board.space_available? next_space
            end
          end
        end
        nil
      end

      def first_move?
        @board.moves == 1
      end

      def opening_move
        return CENTER if @board.space_available? CENTER
        try_until_available { random_corner }
      end

      def random_corner
        CORNERS[rand(4)]
      end

      def random_space
        rand(9)
      end

      def try_until_available
        while true
          space = yield
          return space if @board.space_available? space
        end
      end
    end
  end
end