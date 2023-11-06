require_relative 'piece'

class Pawn < Piece
    attr_reader :color, :allowed_moves

    def initialize(position, color, allowed_moves=find_allowed_moves(position[0], position[1], color))
        super(position, color, allowed_moves)
       
    end

    # This method allows this piece to find all his allowed moves from any position on the table
    def find_allowed_moves(x=@position[0], y=@position[1], color=@color)
        if color == "white"
            if x == 6
                allowed_moves = [[x - 1, y], [x - 2, y]]
            else
                allowed_moves = [[x - 1, y]]
            end
        else
            if x == 1
                allowed_moves = [[x + 1, y], [x + 2, y]]
            else
                allowed_moves = [[x + 1, y]]
            end
        end
        allowed_moves
    end
    
end