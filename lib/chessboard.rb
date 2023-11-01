require_relative 'displayable'


class ChessBoard
    include Displayable
    attr_accessor :data
    def initialize
        @data = Array.new(8, Array.new(8))
    end
end

board_test = ChessBoard.new
board_test.display_chess_board