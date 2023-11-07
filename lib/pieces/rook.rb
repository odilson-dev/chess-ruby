require_relative 'piece'
require_relative '../chessboard'

class Rook < Piece
    attr_reader :allowed_moves, :attack_moves

    def initialize(position, color)
        super(position, color)        
        @attack_moves = []
        @allowed_moves = find_allowed_moves
    end

    # This method allows this piece to find all his allowed moves from any position on the table
    def find_allowed_moves(the_chessboard = ChessBoard.new)
        x = @position[0]
        y = @position[1]
        allowed_moves = []
        #reinitialise attack_moves to empty for each call
        @attack_moves = []
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
end