class Player
    attr_reader :name, :piece_color
    attr_accessor :captured_pieces
    def initialize(name, piece_color)
        @name = name
        @piece_color = piece_color
        @captured_pieces = []
    end
end