
require_relative '../chessboard'

module Findable

     # This method allows a bishops piece to find all their allowed moves from any position on the table
    def find_all_moves_diagonally(the_chessboard = ChessBoard.new )
        x = @position[0]
        y = @position[1]

        allowed_moves = []
        
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

    # This method allows Rook pieces to find all their allowed moves from any position on the table
    def find_all_moves_perpendicularly(the_chessboard = ChessBoard.new)
        x = @position[0]
        y = @position[1]
        allowed_moves = []
        # up squares
        
        (x-1).downto(0) do | num |
            move = [num, y]
            if the_chessboard.data[num][y]&.color == @color
                break
            elsif the_chessboard.data[num][y]&.color.is_a?(String) && the_chessboard.data[num][y]&.color != @color
                @attack_moves << move
                break
            else
                allowed_moves << move
            end
        end

        # down squares
        
        (x+1).upto(7) do | num |
            move = [num, y]
            if the_chessboard.data[num][y]&.color == @color
                break
            elsif the_chessboard.data[num][y]&.color.is_a?(String) && the_chessboard.data[num][y]&.color != @color
                @attack_moves
                @attack_moves << move
                break
            else
                allowed_moves << move
            end
        end

        # #left squares
        (y-1).downto(0) do | num |
            move = [x, num]
            if the_chessboard.data[x][num]&.color == @color
                break
            elsif the_chessboard.data[x][num]&.color.is_a?(String) && the_chessboard.data[num][y]&.color != @color
                @attack_moves << move
                break
            else
                allowed_moves << move
            end
        end

        # #right squares
        (y+1).upto(7) do | num |
            move = [x, num]
            
            if the_chessboard.data[x][num]&.color == @color
                break
            elsif the_chessboard.data[x][num]&.color.is_a?(String) && the_chessboard.data[num][y]&.color != @color
                @attack_moves << move
                break
            else
                allowed_moves << move
            end
        end
        allowed_moves
    end

    def find_both_diagonal_and_perpandicular_moves(the_chessboard)
        #reinitialise the attack moves for each call
        @attack_moves = []

        if self.class.name == "Rook"
            perpendicular_moves = find_all_moves_perpendicularly(the_chessboard)
            return perpendicular_moves
        elsif self.class.name == "Bishop"
            diagonal_moves = find_all_moves_diagonally(the_chessboard)
            return diagonal_moves
        else
            all_allowed_moves = []

            diagonal_moves = find_all_moves_diagonally(the_chessboard)
            perpendicular_moves = find_all_moves_perpendicularly(the_chessboard)

            all_allowed_moves.concat(diagonal_moves)
            all_allowed_moves.concat(perpendicular_moves)

            return all_allowed_moves
        end
        
    end
    
end