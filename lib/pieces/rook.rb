require_relative 'piece'
require_relative '../chessboard'
require_relative 'findable.rb'


class Rook < Piece
    include Findable

    def initialize(position, color, the_chessboard = ChessBoard.new)
        super(position, color)        
        @the_chessboard = the_chessboard
    end

    def allowed_moves(the_chessboard=@the_chessboard)
        find_both_diagonal_and_perpandicular_moves(the_chessboard)
    end

    def attack_moves(the_chessboard=@the_chessboard)
        find_all_attacks_perpendicularly(the_chessboard)
    end

     # Allows Rook instances to find all their attack moves from any position on the chessboard
     def find_all_attacks_perpendicularly(the_chessboard)
        x = @position[0]
        y = @position[1]
        attack_moves = []
        # up squares
        
        (x-1).downto(0) do | num |
            move = [num, y]
            if the_chessboard.data[num][y]&.color == @color
                break
            elsif the_chessboard.data[num][y]&.color.is_a?(String) && the_chessboard.data[num][y]&.color != @color
                attack_moves << move
                break
            end
        end

        # down squares
        
        (x+1).upto(7) do | num |
            move = [num, y]
            if the_chessboard.data[num][y]&.color == @color
                break
            elsif the_chessboard.data[num][y]&.color.is_a?(String) && the_chessboard.data[num][y]&.color != @color
               
                attack_moves << move
                break
            end
        end

        # #left squares
        (y-1).downto(0) do | num |
            move = [x, num]
            if the_chessboard.data[x][num]&.color == @color
                break
            elsif the_chessboard.data[x][num]&.color.is_a?(String) && the_chessboard.data[x][num]&.color != @color
                attack_moves << move
                break
            end
        end

        # #right squares
        (y+1).upto(7) do | num |
            move = [x, num]
            
            if the_chessboard.data[x][num]&.color == @color
                break
            elsif the_chessboard.data[x][num]&.color.is_a?(String) && the_chessboard.data[x][num]&.color != @color
                attack_moves << move
                break
            end
        end
        attack_moves.select { |attack| attack[0] >= 0 and attack[0] <= 7 and attack[1] >= 0 and attack[1] <= 7}    
    end
end