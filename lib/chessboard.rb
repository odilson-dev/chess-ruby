require_relative 'displayable'
require_relative 'pieces/king'
require_relative 'pieces/knight'
require_relative 'pieces/rook'
require_relative 'pieces/queen'
require_relative 'pieces/bishop'
require_relative 'pieces/pawn'



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

    def prepare_chessboard
        # Create all the white pieces, with their exact first positions on the chessboard
        
        white_pieces = [
        rook_white_1 = Rook.new([7, 0], "white"),
        knight_white_1 = Knight.new([7, 1], "white"),
        bishop_white_1 = Bishop.new([7, 2], "white"),

        king_white = King.new([7, 3], "white"),
        queen_white = Queen.new([7, 4], "white"),

        bishop_white_2 = Bishop.new([7, 5], "white"),
        knight_white_2 = Knight.new([7, 6], "white"),
        rook_white_2 = Rook.new([7, 7], "white")
        ]
        

        8.times do | y |
            self.add(Pawn.new([6, y], "white"))
        end

        white_pieces.each { |piece| self.add(piece) }

        # Create all the black pieces, with their exact first positions on the chessboard
        
        black_pieces = [
        rook_black_1 = Rook.new([0, 0], "black"),
        knight_black_1 = Knight.new([0, 1], "black"),
        bishop_black_1 = Bishop.new([0, 2], "black"),

        king_black = King.new([0, 3], "black"),
        queen_black = Queen.new([0, 4], "black"),

        bishop_black_2 = Bishop.new([0, 5], "black"),
        knight_black_2 = Knight.new([0, 6], "black"),
        rook_black_2 = Rook.new([0, 7], "black")
        ]
            

        8.times do | y |
            self.add(Pawn.new([1, y], "black"))
        end

        black_pieces.each { |piece| self.add(piece) }
    end
end


board_test = ChessBoard.new

board_test.prepare_chessboard
board_test.active_piece = board_test.data[1][7]

board_test.display_chess_board

