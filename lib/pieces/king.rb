require_relative 'piece'

class King < Piece
    def initialize(position, color, symbol)
        super(position, color, symbol)
    end

    # This method allows the this piece to find all his allowed moves from any position on the table
    def find_allowed_moves(x = @position[0], y = @position[1])
        allowed_moves = []
        # for x
        for_x = [[x, y + 1], [x, y - 1]]

        # for_x - 1
        for_x_minus_1 = [[x - 1, y + 1], [x - 1, y], [x - 1, y - 1]]

        # for_x + 1
        for_x_plus_1 = [[x + 1, y + 1], [x + 1, y], [x + 1, y - 1]]

        allowed_moves.concat(for_x, for_x_minus_1, for_x_plus_1)
        allowed_moves.select { |position| (position[0] >= 1 && position[0] <= 8) && (position[1] >= 1 && position[1] <= 8) }
    end
end

king = King.new([5, 5], "White", "H")

p king.find_allowed_moves