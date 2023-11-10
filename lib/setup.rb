require_relative 'pieces/rook'
require_relative 'pieces/bishop'
require_relative 'pieces/queen'
require_relative 'pieces/pawn'
require_relative 'pieces/king'
require_relative 'pieces/knight'

def setup(current_chessboard)
    # Create all the white pieces, with their exact first positions on the chessboard
    
    white_pieces = [
    rook_white_1 = Rook.new([7, 0], "white", current_chessboard),
    knight_white_1 = Knight.new([7, 1], "white", current_chessboard),
    bishop_white_1 = Bishop.new([2, 2], "white", current_chessboard),

    king_white = King.new([7, 3], "white", current_chessboard),
    queen_white = Queen.new([7, 4], "white", current_chessboard),

    bishop_white_2 = Bishop.new([3, 3], "white", current_chessboard),
    knight_white_2 = Knight.new([7, 6], "white", current_chessboard),
    rook_white_2 = Rook.new([2, 3], "white", current_chessboard)
    ]
    

    8.times do | y |
        current_chessboard.add(Pawn.new([6, y], "white", current_chessboard))
    end

    white_pieces.each { |piece| current_chessboard.add(piece) }

    # Create all the black pieces, with their exact first positions on the chessboard
    
    black_pieces = [
    rook_black_1 = Rook.new([0, 0], "black", current_chessboard),
    knight_black_1 = Knight.new([0, 1], "black", current_chessboard),
    bishop_black_1 = Bishop.new([0, 2], "black", current_chessboard),

    king_black = King.new([0, 3], "black", current_chessboard),
    queen_black = Queen.new([0, 4], "black", current_chessboard),

    bishop_black_2 = Bishop.new([0, 5], "black", current_chessboard),
    knight_black_2 = Knight.new([0, 6], "black", current_chessboard),
    rook_black_2 = Rook.new([0, 7], "black", current_chessboard)
    ]
        

    8.times do | y |
        current_chessboard.add(Pawn.new([1, y], "black", current_chessboard))
    end

    black_pieces.each { |piece| current_chessboard.add(piece) }
end