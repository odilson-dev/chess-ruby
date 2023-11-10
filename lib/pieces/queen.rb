require_relative 'piece'
require_relative '../chessboard'
require_relative 'findable'

class Queen < Piece
    attr_reader :attack_moves
    include Findable

    def initialize(position, color, the_chessboard = ChessBoard.new)
        super(position, color)
        @attack_moves = []
        @the_chessboard = the_chessboard
    end

    def allowed_moves(the_chessboard = @the_chessboard)
        find_both_diagonal_and_perpandicular_moves(the_chessboard)
    end
end