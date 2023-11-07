require_relative 'piece'
require_relative '../chessboard'

class Queen < Piece
    attr_reader :allowed_moves
    def initialize(position, color)
        super(position, color)
        @allowed_moves = find_allowed_moves(position[0], position[1])
    end

    # This method allows the queen piece to find all his allowed moves from any position on the chessboard.
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

        8.times do | count |
            if count == x
                next
            else
                move = [count, y]
                allowed_moves << move
            end
        end

        8.times do | count |
            if count == y
                next
            else
                move = [x, count]
                allowed_moves << move
            end
        end

        allowed_moves
    end
end