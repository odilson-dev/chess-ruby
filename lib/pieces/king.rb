require_relative 'piece'

class King < Piece
    def initialize(position, color, symbol)
        super(position, color, symbol)
    end
end

king = King.new([5, 5], "White", "H")

p king.captured