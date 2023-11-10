require_relative 'piece'
require_relative '../chessboard'
require_relative 'findable'

class Pawn < Piece
    attr_reader :attack_moves
    include Findable

    def initialize(position, color, the_chessboard=ChessBoard.new)
        super(position, color)
        @attack_moves = find_attack_moves(the_chessboard)
        @the_chessboard = the_chessboard
    end

    def allowed_moves(the_chessboard = @the_chessboard)
        find_allowed_moves_for_pawns(the_chessboard)
    end
    

    def find_attack_moves(the_chessboard)
        x=@position[0]
        y=@position[1]
        if @color == "white"
            possible_attack = [[x - 1, y - 1], [x - 1, y + 1]]
            attack_moves =  possible_attack.select do |position|
                the_chessboard.data.dig(position[0], position[1])&.color.is_a?(String) && the_chessboard.data.dig(position[0], position[1])&.color != @color
            end
            return attack_moves
        else
            possible_attack = [[x + 1, y - 1], [x + 1, y + 1]]
            attack_moves =  possible_attack.select do |position|
                the_chessboard.data.dig(position[0], position[1])&.color.is_a?(String) && the_chessboard.data.dig(position[0], position[1])&.color != @color
            end
            return attack_moves
        end
    end
    
end