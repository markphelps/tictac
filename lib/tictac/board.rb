module Tictac
  class Board

    attr_reader :tiles

    # [0][1][2]
    # [3][4][5]
    # [6][7][8]

    def initialize
      @tiles = []
    end

    def moves
      tiles.compact.count
    end

    def rows
      rows = []
      (0).upto(2) { |n| rows << row(n) }
      rows
    end

    def diagonals
      [ [ tiles[0], tiles[4], tiles[8] ], [ tiles[6], tiles[4], tiles[2] ] ]
    end

    def columns
      cols = []
      (0).upto(2) { |n| cols << column(n) }
      cols
    end

    def row(row)
      [ tiles[row * 3], tiles[(row * 3) + 1], tiles[(row * 3) + 2] ]
    end

    def column(column)
      [ tiles[column], tiles[column + 3], tiles[column + 6]]
    end

    def to_s
      output = ""
      0.upto(8) do |position|
        output << " #{tiles[position] || position} "
        case position % 3
        when 0, 1 then output << "|"
        when 2 then output << "\n-----------\n" unless position == 8
        end
      end
      output
    end
  end
end