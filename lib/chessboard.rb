require_relative 'displayable'
require_relative 'pieces/king.rb'


class ChessBoard
    include Displayable
    attr_accessor :data, :active_square
    def initialize
        @data = Array.new(8) { Array.new(8) }
        @active_square = nil
    end

    def add(this_piece)
        x = this_piece.position[1]
        y = this_piece.position[0]
        @data[y][x] = this_piece
    end
end 
# king = King.new([5, 5], "white")


# board_test = ChessBoard.new

# board_test.add(king)
# board_test.active_square = king


# board_test.display_chess_board