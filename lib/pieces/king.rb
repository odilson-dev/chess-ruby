require_relative 'piece'

class King < Piece
    attr_reader :allowed_moves

    def initialize(position, color, allowed_moves=find_allowed_moves(position[0], position[1]))
        super(position, color, allowed_moves)
    end

    # This method allows the this piece to find all his allowed moves from any position on the table
    def find_allowed_moves(x=@position[0], y=@position[1])
        allowed_moves = []
        # for x
        for_x = [[x, y + 1], [x, y - 1]]

        # for_x - 1
        for_x_minus_1 = [[x - 1, y + 1], [x - 1, y], [x - 1, y - 1]]

        # for_x + 1
        for_x_plus_1 = [[x + 1, y + 1], [x + 1, y], [x + 1, y - 1]]

        allowed_moves.concat(for_x, for_x_minus_1, for_x_plus_1)
        allowed_moves.select { |position| (position[0] >= 0 && position[0] <= 7) && (position[1] >= 0 && position[1] <= 7) }
    end
end