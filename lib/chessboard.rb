require_relative 'displayable'



class ChessBoard
    attr_accessor :data, :active_piece

    include Displayable
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

chessboard = ChessBoard.new


chessboard.display_chess_board
