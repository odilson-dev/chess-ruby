require_relative 'piece'
require_relative '../chessboard'
require_relative 'findable'
class Bishop < Piece
    attr_reader  :attack_moves, :allowed_moves
    include Findable

    def initialize(position, color, the_chessboard = ChessBoard.new)
        super(position, color)
        @attack_moves = []
        @allowed_moves = find_all_moves_diagonally(the_chessboard)
    end

   
    
    
end