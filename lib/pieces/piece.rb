class Piece
    attr_accessor :position, :color, :symbol, :captured, :allowed_moves
    def initialize(position, color, symbol, allowed_moves)
        @position = position
        @color = color
        @symbol = symbol
        @captured = false
        @active_piece = false
        @allowed_moves = allowed_moves
    end
end