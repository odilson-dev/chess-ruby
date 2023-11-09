
require_relative '../chessboard'

module Findable

    # Allows Bishop instances to find all their allowed moves from any position on the chessboard
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

    # Find each diagonal row
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

    # Allows Rook instances to find all their allowed moves from any position on the chessboard
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
    # Allow the Queen instances to find all their allowed moves from any position on the chessboard
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

    # Allow the Pawns instances to find all their allowed moves from any position on the chessboard
    def find_allowed_moves_for_pawns(the_chessboard)
        x=@position[0]
        y=@position[1]

        if @color == "white"
            if x == 6
                allowed_moves = [[x - 1, y], [x - 2, y]]
            else
                allowed_moves = [[x - 1, y]]
            end
        else
            if x == 1
                allowed_moves = [[x + 1, y], [x + 2, y]]
            else
                allowed_moves = [[x + 1, y]]
            end
        end
        allowed_moves.select do |position|
            the_chessboard.data.dig(position[0], position[1]).nil?
        end
    end

    # Allows the knights instances to find all their allowed moves from any position on the table
    def find_allowed_moves_for_knights(the_chessboard)
        x=@position[0]
        y=@position[1]
        all_moves = []
        left_side = [[x - 1, y - 2], [x - 2, y - 1], [x + 1, y - 2], [x + 2, y - 1]]
        right_side = [[x - 2, y + 1], [x - 1, y + 2], [x + 1, y + 2], [x + 2, y + 1]]
        all_moves = left_side.concat right_side

        # remove all the position that aren't part of the chessboard 
        all_moves = all_moves.select { |position| (position[0] >= 0 && position[0] <= 7) && (position[1] >= 0 && position[1] <= 7) }

        allowed_moves = []
        all_moves.each do |position|
            if the_chessboard.data.dig(position[0], position[1])&.color == @color
                next
            elsif the_chessboard.data.dig(position[0], position[1])&.color.is_a?(String) && the_chessboard.data.dig(position[0], position[1])&.color != @color
                @attack_moves << position
            else
                allowed_moves << position
            end
        end
        allowed_moves
    end

    # Allows the King instances to find all their allowed moves from any position on the chessboard
    def find_allowed_moves_for_the_king(the_chessboard)
        x=@position[0]
        y=@position[1]
        all_moves = []
        @attack_moves = []
        # for x
        for_x = [[x, y + 1], [x, y - 1]]

        # for_x - 1
        for_x_minus_1 = [[x - 1, y + 1], [x - 1, y], [x - 1, y - 1]]

        # for_x + 1
        for_x_plus_1 = [[x + 1, y + 1], [x + 1, y], [x + 1, y - 1]]

        all_moves.concat(for_x, for_x_minus_1, for_x_plus_1)
        all_moves.select! { |position| (position[0] >= 0 && position[0] <= 7) && (position[1] >= 0 && position[1] <= 7) }


        allowed_moves = []
        
        all_moves.each do |position|
            if the_chessboard.data.dig(position[0], position[1])&.color == @color
                next
            elsif the_chessboard.data.dig(position[0], position[1])&.color.is_a?(String) && the_chessboard.data.dig(position[0], position[1])&.color != @color
                @attack_moves << position
            else
                allowed_moves << position
            end
        end
        allowed_moves
    end
    
end