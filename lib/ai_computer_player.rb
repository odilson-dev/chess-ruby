require_relative 'player'
require_relative 'setup'
require_relative 'chessboard'

class AI < Player
    def initialize(name, piece_color)
        super(name, piece_color)
    end

end

chessboard = ChessBoard.new
setup(chessboard)
alexa = AI.new("Alexa", "white")
