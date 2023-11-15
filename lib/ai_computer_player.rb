require_relative 'player'
require_relative 'setup'
require_relative 'chessboard'

class AI < Player
    def initialize(name, piece_color)
        super(name, piece_color)
    end

    def choose_a_piece_to_move(chessboard)
        my_pieces = chessboard.data.flatten.select { |piece| piece&.color == @piece_color }

        pieces_with_attack_moves = my_pieces.select { |piece| piece.attack_moves.length > 0 }

        pieces_with_allowed_moves = my_pieces.select { |piece| piece.allowed_moves.length > 0 }

        if pieces_with_attack_moves.empty?

            piece_choosed = pieces_with_allowed_moves.sample
        else

            piece_choosed = pieces_with_attack_moves.sample
        end
        
        convert_inverse(piece_choosed.position)
    end

    def choose_a_position_to_move(my_piece)
        if my_piece.attack_moves.empty?
            position = my_piece.allowed_moves.sample
        else
            position = my_piece.attack_moves.sample
        end
    
        convert_inverse(position)
    end

    def convert_inverse(input)
        dict_alpha = {
            0 => "a",
            1 => "b",
            2 => "c",
            3 => "d",
            4 => "e",
            5 => "f",
            6 => "g",
            7 => "h",
        }
        dict_digit = {
            7 => 1,
            6 => 2,
            5 => 3,
            4 => 4,
            3 => 5,
            2 => 6,
            1 => 7,
            0 => 8
        }
        return dict_alpha[input[1]] + dict_digit[input[0]].to_s
    end
end
