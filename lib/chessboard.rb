require_relative 'displayable'
require_relative 'pieces/king.rb'
require_relative 'pieces/queen.rb'


class ChessBoard
    include Displayable
    attr_accessor :data, :active_piece
    def initialize
        @data = Array.new(8) { Array.new(8) }
        @active_piece = nil
    end

    def add(this_piece)
        x = this_piece.position[1]
        y = this_piece.position[0]
        @data[y][x] = this_piece
    end
end 
queen = Queen.new([3, 4], "white")


board_test = ChessBoard.new

board_test.add(queen)
board_test.active_piece = queen

board_test.data.each { |row| p row}
board_test.display_chess_board