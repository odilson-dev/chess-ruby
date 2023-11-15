require_relative 'piece'
require_relative '../chessboard'
require_relative 'findable'


class Bishop < Piece
    
    include Findable

    def initialize(position, color, the_chessboard=ChessBoard.new)
        super(position, color)
        @the_chessboard = the_chessboard 
    end
    

    def allowed_moves(the_chessboard = @the_chessboard)
        find_both_diagonal_and_perpandicular_moves(the_chessboard=@the_chessboard)
    end

    def attack_moves(the_chessboard = @the_chessboard)
        find_all_attacks_diagonally(the_chessboard)
    end
    # Allows Bishop instances to find all their attack moves from any position on the chessboard
    def find_all_attacks_diagonally(the_chessboard)
        x = @position[0]
        y = @position[1]

        all_attacks = []

        position = [x, y]
        top_right_algorithm = lambda { |position| [position[0] - 1, position[1] + 1] }
        top_right = find_each_attack_diagonally(top_right_algorithm, the_chessboard)
        all_attacks.concat(top_right)

        top_left_algorithm = lambda { |position| [position[0] - 1, position[1] - 1] }
        top_left = find_each_attack_diagonally(top_left_algorithm, the_chessboard)
        all_attacks.concat(top_left)
        
        bottom_right_algorithm = lambda { |position| [position[0] + 1, position[1] + 1] }
        bottom_right = find_each_attack_diagonally(bottom_right_algorithm, the_chessboard)
        all_attacks.concat(bottom_right)

        bottom_left_algorithm = lambda { |position| [position[0] + 1, position[1] - 1] }
        bottom_left = find_each_attack_diagonally(bottom_left_algorithm, the_chessboard)
        all_attacks.concat(bottom_left)

        all_attacks.select { |attack| attack[0] >= 0 and attack[0] <= 7 and attack[1] >= 0 and attack[1] <= 7}
       
    end

    # Find each diagonal attack position
    def find_each_attack_diagonally(algorithm, the_chessboard)
        x = @position[0]
        y = @position[1]

        
        position = [x, y]
        attack_position = []
        loop  do
            position = algorithm.call(position)
            if the_chessboard.data.dig(position[0], position[1])&.color == @color
                break
            elsif the_chessboard.data.dig(position[0], position[1])&.color.is_a?(String) && the_chessboard.data.dig(position[0], position[1])&.color != @color
            
                attack_position << position
                break
            else
                break if (position[0] < 0 or position[0] > 7 or position[1] < 0 or position[1] > 7)
            end
        end
        attack_position
    end


end