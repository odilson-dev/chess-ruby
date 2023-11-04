require_relative 'piece'

class Knight < Piece
    attr_reader :allowed_moves

    def initialize(position, color, symbol=" \u265A ", allowed_moves=find_allowed_moves(position[0], position[1]))
        super(position, color, symbol, allowed_moves)
    end
end