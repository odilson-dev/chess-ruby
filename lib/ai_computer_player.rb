require_relative 'player'
require_relative 'setup'
require_relative 'chessboard'

class AI < Player
    def initialize(name, piece_color)
        super(name, piece_color)
    end

    def choose_a_piece_to_move(chessboard)
        my_pieces = chessboard.data.flatten.select { |piece| piece&.color == piece_color }

        pieces_with_attack_moves = my_pieces.select { |piece| piece.attack_moves.length > 0 }

        pieces_with_allowed_moves = my_pieces.select { |piece| piece.allowed_moves.length > 0 }

        if pieces_with_attack_moves.empty?

            piece_choosed = pieces_with_allowed_moves.sample
        else

            piece_choosed = pieces_with_attack_moves.sample
        end
        
        piece_choosed
    end
end

chessboard = ChessBoard.new
setup(chessboard)
alexa = AI.new("Alexa", "white")

p alexa.choose_a_piece_to_move(chessboard)