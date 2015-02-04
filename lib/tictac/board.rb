module Tictac
  class Board

    attr_reader :spaces

    # [0][1][2]
    # [3][4][5]
    # [6][7][8]

    WINNING_COMBINATIONS = [
      # Horizontal wins:
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      # Vertical wins:
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      # Diagonal wins:
      [0, 4, 8], [2, 4, 6]
    ]

    def initialize
      @spaces = Array.new(9)
    end

    def moves
      spaces.compact.count
    end

    def place_piece(space, piece)
      spaces[space] = piece
    end

    def valid_move?(space)
      (0..8).include?(space) && space_available?(space)
    end

    def space_available?(space)
      spaces[space].nil?
    end

    def available_spaces
      available = []
      spaces.each_index do |i|
        available << i if space_available? i
      end
      available
    end

    def winning_combination
      WINNING_COMBINATIONS.each do |combo|
        if spaces[combo[0]] == spaces[combo[1]] && spaces[combo[1]] == spaces[combo[2]]
          return combo unless spaces[combo[0]].nil?
        end
      end
      false
    end

    def winner
      combo = winning_combination
      combo ? spaces[combo[0]] : false
    end

    def tie?
      available_spaces.empty?
    end

    private

    def initialize_dup(other)
      super other
      @spaces = other.spaces.dup
    end
  end
end