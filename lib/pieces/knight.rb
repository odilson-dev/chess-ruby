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

    def allowed_moves(the_chessboard = @the_chessboard)
        find_allowed_moves_for_knights(the_chessboard)
    end

    def attack_moves(the_chessboard = @the_chessboard)
        find_all_attack_moves_for_knights(the_chessboard)
    end

    def find_all_attack_moves_for_knights(the_chessboard)
        x=@position[0]
        y=@position[1]
        all_moves = []
        left_side = [[x - 1, y - 2], [x - 2, y - 1], [x + 1, y - 2], [x + 2, y - 1]]
        right_side = [[x - 2, y + 1], [x - 1, y + 2], [x + 1, y + 2], [x + 2, y + 1]]
        all_moves = left_side.concat right_side

        # remove all the position that aren't part of the chessboard 
        all_moves = all_moves.select { |position| (position[0] >= 0 && position[0] <= 7) && (position[1] >= 0 && position[1] <= 7) }

        all_attacks = []
        all_moves.each do |position|
            if the_chessboard.data.dig(position[0], position[1])&.color == @color
                next
            elsif the_chessboard.data.dig(position[0], position[1])&.color.is_a?(String) && the_chessboard.data.dig(position[0], position[1])&.color != @color
                all_attacks << position
            end
        end
        all_attacks
    end
    
end