require_relative 'piece'
require_relative 'findable'

class Bishop < Piece
    attr_reader :allowed_moves, :attack_moves
    include Findable
    
    def initialize(position, color, the_chessboard=ChessBoard.new)
        super(position, color)
        @attack_moves = []
        @allowed_moves = find_allowed_moves_diagonally(the_chessboard)
    end
    
end