require_relative 'piece'
require_relative '../chessboard'
require_relative 'findable'


class King < Piece
    include Findable
    
    def initialize(position, color, the_chessboard=ChessBoard.new)
        super(position, color)
        @the_chessboard = the_chessboard
    end

    def allowed_moves(the_chessboard = @the_chessboard)
        find_allowed_moves_for_the_king(the_chessboard)
    end

    def attack_moves(the_chessboard = @the_chessboard)
        find_all_attack_moves_for_the_king(the_chessboard)
    end

    # Allows the King instances to find all their attack moves from any position on the chessboard
    def find_all_attack_moves_for_the_king(the_chessboard = @the_chessboard)
        x=@position[0]
        y=@position[1]
        all_moves = []
        all_attacks = []
        # for x
        for_x = [[x, y + 1], [x, y - 1]]

        # for_x - 1
        for_x_minus_1 = [[x - 1, y + 1], [x - 1, y], [x - 1, y - 1]]

        # for_x + 1
        for_x_plus_1 = [[x + 1, y + 1], [x + 1, y], [x + 1, y - 1]]

        all_moves.concat(for_x, for_x_minus_1, for_x_plus_1)
        all_moves.select! { |position| (position[0] >= 0 && position[0] <= 7) && (position[1] >= 0 && position[1] <= 7) }

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