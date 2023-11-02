class Piece
    attr_accessor :position, :color, :symbol, :captured, :allowed_moves
    def initialize(position, color, symbol)
        @position = position
        @color = color
        @symbol = symbol
        @captured = false
        @allowed_moves = []
    end
end