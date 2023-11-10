require_relative 'piece'
require_relative '../chessboard'
require_relative 'findable'


class Knight < Piece
    attr_reader :attack_moves
    include Findable

    def initialize(position, color, the_chessboard = ChessBoard.new)
        super(position, color)
        @attack_moves = []
        @the_chessboard = the_chessboard
    end

    def allowed_moves(the_chessboard=@the_chessboard)
        find_allowed_moves_for_knights(the_chessboard)
    end

    
end