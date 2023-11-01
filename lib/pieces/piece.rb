class Piece
    def initialize(position, color, symbol)
        @position = position
        @color = color
        @symbol = symbol
        @captured = false
        @allowed_moves = []
    end
end