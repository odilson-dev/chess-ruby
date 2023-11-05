require_relative 'piece'

class Rook < Piece
    attr_reader :allowed_moves

    def initialize(position, color, allowed_moves=find_allowed_moves(position[0], position[1]))
        super(position, color, allowed_moves)
    end

    # This method allows the this piece to find all his allowed moves from any position on the table
    def find_allowed_moves(x=@position[0], y=@position[1])
        allowed_moves = []
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