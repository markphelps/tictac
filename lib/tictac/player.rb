module Tictac
  class Player

    attr_reader :piece

    def initialize(piece)
      @piece = piece
    end

    def move(board)
      raise 'Not Implemented'
    end

    def to_s
      piece
    end
  end
end