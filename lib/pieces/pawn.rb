require_relative 'piece'
require_relative '../chessboard'

class Pawn < Piece
    attr_reader :color, :allowed_moves, :attack_moves

    def initialize(position, color, the_chessboard=ChessBoard.new)
        super(position, color)
        @attack_moves = find_attack_moves(the_chessboard)
        @allowed_moves = find_allowed_moves(the_chessboard)
       
    end

    # This method allows this piece to find all his allowed moves from any position on the table
    def find_allowed_moves(the_chessboard)
        x=@position[0]
        y=@position[1]

        if @color == "white"
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
        allowed_moves.select do |position|
            the_chessboard.data.dig(position[0], position[1]).nil?
        end
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