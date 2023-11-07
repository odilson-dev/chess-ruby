class Piece
    attr_accessor :position, :color
    def initialize(position, color)
        @position = position
        @color = color
        @pawn_color = nil
    end

    
    # Allow each subclass instances to automatically find their symbol according to their class name and color
    def symbol
        case self.class.name
        when "King"
            @color == "white" ? " \u2654 " : " \u265A "
        when "Queen"
            @color == "white" ? " \u2655 " : " \u265B "
        when "Rook"
            @color == "white" ? " \u2656 " : " \u265C "
        when "Bishop"
            @color == "white" ? " \u2657 " : " \u265D "
        when "Knight"
            @color == "white" ? " \u2658 " : " \u265E "
        when "Pawn"
            if @color == "white" 
                @pawn_color = "white"
                " \u2659 "
            else
                @pawn_color = "black"
                 " \u265F "
            end
        end
    end
end