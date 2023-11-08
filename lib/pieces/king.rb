require_relative 'piece'
require_relative '../chessboard'

class King < Piece
    attr_reader :allowed_moves, :attack_moves

    def initialize(position, color, the_chessboard=ChessBoard.new)
        super(position, color)
        @attack_moves = []
        @allowed_moves = find_allowed_moves(the_chessboard)
    end

    # This method allows the King piece to find all his allowed moves from any position on the table
    def find_allowed_moves(the_chessboard)
        x=@position[0]
        y=@position[1]
        all_moves = []
        @attack_moves = []
        # for x
        for_x = [[x, y + 1], [x, y - 1]]

        # for_x - 1
        for_x_minus_1 = [[x - 1, y + 1], [x - 1, y], [x - 1, y - 1]]

        # for_x + 1
        for_x_plus_1 = [[x + 1, y + 1], [x + 1, y], [x + 1, y - 1]]

        all_moves.concat(for_x, for_x_minus_1, for_x_plus_1)
        all_moves.select! { |position| (position[0] >= 0 && position[0] <= 7) && (position[1] >= 0 && position[1] <= 7) }


        allowed_moves = []
        
        all_moves.each do |position|
            if the_chessboard.data.dig(position[0], position[1])&.color == @color
                next
            elsif the_chessboard.data.dig(position[0], position[1])&.color.is_a?(String) && the_chessboard.data.dig(position[0], position[1])&.color != @color
                @attack_moves << position
            else
                allowed_moves << position
            end
        end
        allowed_moves
    end
end