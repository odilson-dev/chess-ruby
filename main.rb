require_relative 'lib/pieces/queen.rb'
require_relative 'lib/pieces/king.rb'

king_white = King.new([4, 5], "White")
king_black = King.new([3, 5], "Black")

queen_white = Queen.new([4, 5], "White")
queen_black = Queen.new([3, 5], "Black")



p queen_black.symbol
p queen_white.symbol
p king_black.symbol
p king_white.symbol
