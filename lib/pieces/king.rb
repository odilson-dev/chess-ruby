require_relative 'piece'
require_relative '../chessboard'
require_relative 'findable'


class King < Piece
    attr_reader :allowed_moves, :attack_moves
    include Findable
    def initialize(position, color, the_chessboard=ChessBoard.new)
        super(position, color)
        @attack_moves = []
        @allowed_moves = find_allowed_moves_for_the_king(the_chessboard)
    end

    
end