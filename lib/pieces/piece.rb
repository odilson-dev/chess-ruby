class Piece
    attr_accessor :position, :color, :captured, :allowed_moves
    def initialize(position, color, allowed_moves)
        @position = position
        @color = color
        @captured = false
        @active_piece = false
        @allowed_moves = allowed_moves
    end

    def symbol
        case self.class.name
        when "King"
            @color == "White" ? " \u2654 " : " \u265A "
        when "Queen"
            @color == "White" ? " \u2655 " : " \u265B "
        when "Rook"
            @color == "White" ? " \u2656 " : " \u265C "
        when "Bishop"
            @color == "White" ? " \u2657 " : " \u265D "
        when "Knight"
            @color == "White" ? " \u2658 " : " \u265E"
        when "Pawn"
            @color == "White" ? " \u2659 " : " \u265F "
        else
            nil
        end
    end
end