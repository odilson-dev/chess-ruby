require_relative 'piece'

class Knight < Piece
    attr_reader :allowed_moves

    def initialize(position, color, allowed_moves=find_allowed_moves(position[0], position[1]))
        super(position, color, allowed_moves)
    end

    # This method allows the this piece to find all his allowed moves from any position on the table
    def find_allowed_moves(x=@position[0], y=@position[1])
    moves_allowed = []
    left_side = [[x - 1, y - 2], [x - 2, y - 1], [x + 1, y - 2], [x + 2, y - 1]]
    right_side = [[x - 2, y + 1], [x - 1, y + 2], [x + 1, y + 2], [x + 2, y + 1]]
    moves_allowed = left_side.concat right_side

    # remove all the position that aren't part of the chessboard 
    moves_allowed = moves_allowed.select { |position| (position[0] >= 0 && position[0] <= 7) && (position[1] >= 0 && position[1] <= 7) }

    moves_allowed
    end
end