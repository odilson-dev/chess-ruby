require_relative 'piece'
require_relative '../chessboard'
class Bishop < Piece
    attr_reader :allowed_moves, :attack_moves, :allowed_moves

    def initialize(position, color)
        super(position, color)
        @attack_moves = []
        @allowed_moves = find_allowed_moves
    end

    # This method allows a bishop piece to find all his allowed moves from any position on the table
    
    def find_allowed_moves(the_chessboard = ChessBoard.new )
        x = @position[0]
        y = @position[1]
        @attack_moves = []
        allowed_moves = []
        position = [x, y]
        loop  do 
            # Top-right
            position = [position[0] - 1, position[1] + 1]
            
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
        position = [x, y]
        
        loop  do
            #Top-left
            position = [position[0] - 1, position[1] - 1]
            
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

        position = [x, y]
        
        loop  do
            #Bottom-right
            position = [position[0] + 1, position[1] + 1]
            
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
        
        position = [x, y]
        loop  do
            #Bottom-left
            position = [position[0] + 1, position[1] - 1]
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