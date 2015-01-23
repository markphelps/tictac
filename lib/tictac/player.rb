module Tictac
  class Player

    attr_reader :marker

    def initialize(marker, board)
      @marker = marker
      @board = board
    end

    def move
      tile = next_move
      @board.tiles[tile] = marker
    end

    def next_move
      raise NotImplementedError
    end

    def winner?
      won = Proc.new {|tiles| tiles.all? { |t| t == marker }}
      @board.rows.any?(&won) || @board.columns.any?(&won) || @board.diagonals.any?(&won)
    end

    def to_s
      @marker
    end
  end
end