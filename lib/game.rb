require_relative 'setup'

require_relative 'chessboard'
require 'colorize'

class ChessGame
    def initialize
        @chessboard = ChessBoard.new
        
    end
    def play_with_two_humans
        puts "Player-1 What is your name?"
        name1 = gets.chomp
        player_1 = Player.new(name1, "white")

        puts "Okay, #{player_1.name}, the white pieces have been assigned to you"

        puts "Player-2 What is your name?"
        name2 = gets.chomp
        player_2 = Player.new(name2, "black")

        puts "Okay, #{player_2.name}, the black pieces have been assigned to you"
        @chessboard.display_chess_board

        loop do
            puts "It's #{player_1.name}'s turn"
            puts "Choose the piece you want to move. eg(d1)"
            position_of_the_choosed_piece = gets.chomp
            if position_of_the_choosed_piece.length != 2
                puts "Invalid input".light_red
                puts "Your position should be two characters length".light_blue
                redo
                
            elsif (("a".."h").to_a.include? position_of_the_choosed_piece[0] && ("1".."8").to_a.include? position_of_the_choosed_piece[1])
                @chessboard.active_piece = 
                
            else
                puts "Invalid input".light_red
                puts "Your position should be composed of a letter between 'a' and 'h' and a digit between '1' and '8'".light_blue
                redo
                
            end
        end
    end

    # convert player inputs to arrays locgic
    def convert(input)
        
    end

end

# chessboard = ChessBoard.new



# setup(chessboard)
# chessboard.active_piece = chessboard.data.dig(3, 3)
# p chessboard.active_piece.attack_moves
# p chessboard.active_piece.allowed_moves
# chessboard.display_chess_board