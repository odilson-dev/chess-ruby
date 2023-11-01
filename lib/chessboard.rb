
class ChessBoard
    attr_accessor :data
    def initialize
        @data = Array.new(8, Array.new(8))
    end
end

board_test = ChessBoard.new