require_relative 'piece'
require_relative '../chessboard'
require_relative 'findable.rb'

class Rook < Piece
    attr_reader :allowed_moves, :attack_moves
    include Findable

    def initialize(position, color, the_chessboard=ChessBoard.new)
        super(position, color)        
        @attack_moves = []
        @allowed_moves = find_all_moves_perpendicularly(the_chessboard)
    end
end