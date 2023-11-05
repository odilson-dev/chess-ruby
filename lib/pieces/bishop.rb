require_relative 'piece'

class Bishop < Piece
    attr_reader :allowed_moves

    def initialize(position, color, allowed_moves=find_allowed_moves(position[0], position[1]))
        super(position, color, allowed_moves)
    end

    # This method allows a bishop piece to find all his allowed moves from any position on the table
    
    def find_allowed_moves(x=@position[0], y=@position[1])
        allowed_moves = []
        position = [x, y]
        loop  do 
            position = [position[0] - 1, position[1] + 1]
            break if (position[0] < 0 or position[0] > 7 or position[1] < 0 or position[1] > 7)
            allowed_moves << position
        end
        position = [x, y]
        loop  do 
            position = [position[0] - 1, position[1] - 1]
            break if (position[0] < 0 or position[0] > 7 or position[1] < 0 or position[1] > 7)
            allowed_moves << position
        end
        position = [x, y]
        loop  do 
            position = [position[0] + 1, position[1] + 1]
            break if (position[0] < 0 or position[0] > 7 or position[1] < 0 or position[1] > 7)
            allowed_moves << position
        end
        position = [x, y]
        loop  do 
            position = [position[0] + 1, position[1] - 1]
            break if (position[0] < 0 or position[0] > 7 or position[1] < 0 or position[1] > 7)
            allowed_moves << position
        end
    
        allowed_moves
    end
end