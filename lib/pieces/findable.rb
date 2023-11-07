
require_relative '../chessboard'

module Findable
     # This method allows a bishop piece to find all his allowed moves from any position on the table
    def find_all_moves_diagonally(the_chessboard = ChessBoard.new )
        x = @position[0]
        y = @position[1]

        allowed_moves = []
        

        #reinitialise the attack moves for each call
        @attack_moves = []
        position = [x, y]
        top_right_algorithm = lambda { |position| [position[0] - 1, position[1] + 1] }
        top_right = find_diagonal(top_right_algorithm, the_chessboard)
        allowed_moves.concat(top_right)

        top_left_algorithm = lambda { |position| [position[0] - 1, position[1] - 1] }
        top_left = find_diagonal(top_left_algorithm, the_chessboard)
        allowed_moves.concat(top_left)
        
        bottom_right_algorithm = lambda { |position| [position[0] + 1, position[1] + 1] }
        bottom_right = find_diagonal(bottom_right_algorithm, the_chessboard)
        allowed_moves.concat(bottom_right)

        bottom_left_algorithm = lambda { |position| [position[0] + 1, position[1] - 1] }
        bottom_left = find_diagonal(bottom_left_algorithm, the_chessboard)
        allowed_moves.concat(bottom_left)

        allowed_moves
       
    end

    def find_diagonal(algorithm, the_chessboard)
        x = @position[0]
        y = @position[1]

        
        position = [x, y]
        allowed_moves = []
        loop  do
            position = algorithm.call(position)
            if the_chessboard.data.dig(position[0], position[1])&.color == @color
                break
            elsif the_chessboard.data.dig(position[0], position[1])&.color.is_a?(String) && the_chessboard.data.dig(position[0], position[1])&.color != @color
                @attack_moves << position
                break
            else
                break if (position[0] < 0 or position[0] > 7 or position[1] < 0 or position[1] > 7)
                allowed_moves << position
            end
        end
        allowed_moves
    end
    
end