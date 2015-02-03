require 'tictac/player'

module Tictac
  module Players
    class Computer < Tictac::Player

      # [0][1][2]
      # [3][4][5]
      # [6][7][8]

      OPPONENT = 'X'

      CENTER = 4

      CORNERS = [0, 2, 6, 8]

      OPPOSITE_CORNERS = { 0 => 8, 8 => 0, 2 => 6, 6 => 2}

      DIAGONALS = [[0, 4, 8], [2, 4, 6]]

      EDGES = [1, 5, 7, 3]

      # All spaces on board that will win
      WINNING_SPACES = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

      # All spaces on board that will create a fork
      FORK_SPACES = [[0, 2, 8], [2, 8, 6], [8, 6, 0], [6, 0, 2], [1, 2, 5], [5, 8, 7], [7, 6, 3], [3, 0, 1]]

      # Order in which we should check for wins/forks
      PRIORITIES = [[0, 1, 2], [0, 2, 1], [1, 2, 0]]

      def initialize(board)
        super('O', board)
      end

      def next_move
        attack || block || create_fork || force_defend || block_fork || center || opposite_corner || empty_corner || empty_edge
      end

      def attack
        winning_move @marker
      end

      def block
        winning_move OPPONENT
      end

      def create_fork
        fork_move(@marker)
      end

      def block_fork
        fork_move(OPPONENT)
      end

      def center
        return CENTER if @board.space_available? CENTER
      end

      def opposite_corner
        CORNERS.each do |corner|
          if @board.tiles[corner] == OPPONENT
            opposite = OPPOSITE_CORNERS[corner]
            return opposite if @board.space_available? opposite
          end
        end
        nil
      end

      def force_defend
        DIAGONALS.each do |position|
          if @board.tiles[position[0]] == OPPONENT && @board.tiles[position[1]] == @marker && @board.tiles[position[2]] == OPPONENT
            return empty_edge
          end
        end
        nil
      end

      def empty_corner
        while true
          space = CORNERS[rand(4)]
          return space if @board.space_available? space
        end
      end

      def empty_edge
        while true
          space = EDGES[rand(4)]
          return space if @board.space_available? space
        end
      end

      def fork_move(player)
        FORK_SPACES.each do |space|
          PRIORITIES.each do |priority|
            # If player is in 2 of 3 fork spaces
            if (@board.tiles[space[priority[0]]] == player) && (@board.tiles[space[priority[1]]] == player)
              # Check if final winning space is available
              next_space = space[priority[2]]
              return next_space if @board.space_available? next_space
            end
          end
        end
        nil
      end

      def winning_move(player)
        WINNING_SPACES.each do |space|
          PRIORITIES.each do |priority|
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
    end
  end
end