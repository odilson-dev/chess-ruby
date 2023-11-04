require_relative 'piece'

class Bishop < Piece
    attr_reader :allowed_moves

    def initialize(position, color, symbol=" \u265A ", allowed_moves=find_allowed_moves(position[0], position[1]))
        super(position, color, symbol, allowed_moves)
    end

    # This method allows the this piece to find all his allowed moves from any position on the table
    
end