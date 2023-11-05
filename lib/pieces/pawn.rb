require_relative 'piece'

class Pawn < Piece
    attr_reader :allowed_moves

    def initialize(position, color, symbol=" \u265A ", allowed_moves=find_allowed_moves(position[0], position[1]))
        super(position, color, symbol, allowed_moves)
    end

    # This method allows the this piece to find all his allowed moves from any position on the table
    def find_allowed_moves(x=@position[0], y=@position[1])
        if color == "White"
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