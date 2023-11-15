require_relative 'setup'
require_relative 'player'
require_relative 'ai_computer_player'
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
        
        setup(@chessboard)
        

        current_player = player_1
        loop do
            @chessboard.display
            current_player.show_captured_piece
            puts "It's #{current_player.name}'s turn"
            puts "Choose the piece you want to move. eg(d1)"
            position_of_the_choosed_piece = gets.chomp
            if position_of_the_choosed_piece.length != 2
                puts "Invalid input".light_red
                puts "Your position should be two characters length".light_blue
                redo
                
            elsif (("a".."h").to_a.include?(position_of_the_choosed_piece[0]) && ("1".."8").to_a.include?(position_of_the_choosed_piece[1]))
                array_index_positions = convert(position_of_the_choosed_piece)
                
                @chessboard.active_piece = @chessboard.data[array_index_positions[0]][array_index_positions[1]]
                
                if @chessboard.active_piece.nil?
                    puts "This square doesn't have any #{current_player.piece_color} piece \nPlease try again"
                    @chessboard.active_piece = nil
                    redo
                elsif @chessboard.active_piece.color != current_player.piece_color
                    puts "WARNING, You can't move this piece".light_red
                    @chessboard.active_piece = nil
                    redo

                else    
                    @chessboard.display
                    puts "#{current_player.name}'s captured pieces:"
                    puts current_player.captured_pieces.map { |piece| piece.symbol }.join(" ").colorize(background: :cyan)
                    loop do
                        puts "Choose the position you want to move your piece to"
                        new_position = gets.chomp
                        if new_position.length != 2
                            puts "Invalid input".light_red
                            puts "Your position should be two characters length".light_blue
                            redo
                        elsif (("a".."h").to_a.include?(new_position[0]) && ("1".."8").to_a.include?(new_position[1]))
                            array_indexes_of_new_positions = convert(new_position)

                            # Check if the position of the choosed piece is included inside the active_piece's attack_moves
                            if @chessboard.active_piece.attack_moves.include?(array_indexes_of_new_positions)
                                the_attacked_piece = @chessboard.data.dig(array_indexes_of_new_positions[0], array_indexes_of_new_positions[1])

                                if the_attacked_piece.class.name == "King"
                                    puts "CHECKMATE".light_green
                                    puts "Congratulations #{current_player.name}, you win!!!".light_green
                                    break 2
                                end


                                # Capture the enemy's piece
                                @chessboard.remove(the_attacked_piece)
                                the_attacked_piece.position = nil
                                current_player.captured_pieces << the_attacked_piece

                                #remove the active piece with old position
                                @chessboard.remove(@chessboard.active_piece)

                                # Add the active piece to the new position
                                @chessboard.active_piece.position = array_indexes_of_new_positions
                                @chessboard.add(@chessboard.active_piece)
                                @chessboard.active_piece = nil
                                
                                break

                            # Check if the position of the choosed piece is included inside the active_piece's allowed_moves
                            elsif @chessboard.active_piece.allowed_moves.include?(array_indexes_of_new_positions)

                                #remove the active piece with old position
                                @chessboard.remove(@chessboard.active_piece)
                                # Add the active piece with the new position
                                @chessboard.active_piece.position = array_indexes_of_new_positions
                                @chessboard.add(@chessboard.active_piece)
                                @chessboard.active_piece = nil
                                break
                            else
                                puts "WARNING, you can't move this piece there".light_red
                                redo
                            end
                        else
                            puts "Invalid input".light_red
                            puts "Your position should be composed of a letter between 'a' and 'h' and a digit between '1' and '8'".light_blue
                            redo
                        end
                    end
                end
            else
                puts "Your position should be composed of a letter between 'a' and 'h' and a digit between '1' and '8'".light_blue
                redo
                
            end
            current_player == player_1 ? current_player = player_2 : current_player = player_1
        end
    end


    def play_between_human_and_ai
        puts "Player-1 What is your name?"
        name1 = gets.chomp
        player_1 = Player.new(name1, "white")

        player_2 = AI.new("Alexa", "black")

        puts "Okay, #{player_1.name}, the white pieces have been assigned to you"
        

        puts "You'll be playing with a AI called 'Alexa', the black pieces have been assigned to her"
        puts "Good luck!!"
        
        setup(@chessboard)
        

        current_player = player_1
        loop do
            @chessboard.display
            current_player.show_captured_piece
            puts "It's #{current_player.name}'s turn"
            puts "Choose the piece you want to move. eg(d1)"
            if current_player.class.name == "Player"
                position_of_the_choosed_piece = gets.chomp
            else
                position_of_the_choosed_piece = current_player.choose_a_piece_to_move(@chessboard)
            end
            
            if position_of_the_choosed_piece.length != 2
                puts "Invalid input".light_red
                puts "Your position should be two characters length".light_blue
                redo
                
            elsif (("a".."h").to_a.include?(position_of_the_choosed_piece[0]) && ("1".."8").to_a.include?(position_of_the_choosed_piece[1]))
                array_index_positions = convert(position_of_the_choosed_piece)
                
                @chessboard.active_piece = @chessboard.data[array_index_positions[0]][array_index_positions[1]]
                
                if @chessboard.active_piece.nil?
                    puts "This square doesn't have any #{current_player.piece_color} piece \nPlease try again"
                    @chessboard.active_piece = nil
                    redo
                elsif @chessboard.active_piece.color != current_player.piece_color
                    puts "WARNING, You can't move this piece".light_red
                    @chessboard.active_piece = nil
                    redo

                else    
                    @chessboard.display
                    current_player.show_captured_piece
                    loop do
                        puts "Choose the position you want to move your piece to"
                        if current_player.class.name == "Player"
                            new_position = gets.chomp
                        else
                            new_position = current_player.choose_a_position_to_move(@chessboard.active_piece)
                        end
                        if new_position.length != 2
                            puts "Invalid input".light_red
                            puts "Your position should be two characters length".light_blue
                            redo
                        elsif (("a".."h").to_a.include?(new_position[0]) && ("1".."8").to_a.include?(new_position[1]))
                            array_indexes_of_new_positions = convert(new_position)

                            # Check if the position of the choosed piece is included inside the active_piece's attack_moves
                            if @chessboard.active_piece.attack_moves.include?(array_indexes_of_new_positions)
                                the_attacked_piece = @chessboard.data.dig(array_indexes_of_new_positions[0], array_indexes_of_new_positions[1])

                                if the_attacked_piece.class.name == "King"
                                    puts "CHECKMATE".light_green
                                    puts "Congratulations #{current_player.name}, you win!!!".light_green
                                    break 2
                                end


                                # Capture the enemy's piece
                                @chessboard.remove(the_attacked_piece)
                                the_attacked_piece.position = nil
                                current_player.captured_pieces << the_attacked_piece

                                #remove the active piece with old position
                                @chessboard.remove(@chessboard.active_piece)

                                # Add the active piece to the new position
                                @chessboard.active_piece.position = array_indexes_of_new_positions
                                @chessboard.add(@chessboard.active_piece)
                                @chessboard.active_piece = nil
                                
                                break

                            # Check if the position of the choosed piece is included inside the active_piece's allowed_moves
                            elsif @chessboard.active_piece.allowed_moves.include?(array_indexes_of_new_positions)

                                #remove the active piece with old position
                                @chessboard.remove(@chessboard.active_piece)
                                # Add the active piece with the new position
                                @chessboard.active_piece.position = array_indexes_of_new_positions
                                @chessboard.add(@chessboard.active_piece)
                                @chessboard.active_piece = nil
                                break
                            else
                                puts "WARNING, you can't move this piece there".light_red
                                redo
                            end
                        else
                            puts "Invalid input".light_red
                            puts "Your position should be composed of a letter between 'a' and 'h' and a digit between '1' and '8'".light_blue
                            redo
                        end
                    end
                end
            else
                puts "Your position should be composed of a letter between 'a' and 'h' and a digit between '1' and '8'".light_blue
                redo
                
            end
            current_player == player_1 ? current_player = player_2 : current_player = player_1
        end
    end


    def play_with_two_ai
        
        player_1 = AI.new("Siri", "white")

        player_2 = AI.new("Alexa", "black")

        puts "Hello, my name is #{player_1.name}, and i'll play with the white pieces"
        sleep(3)
        puts "Hello, my name is #{player_2.name}, and i'll play with the black pieces"
        sleep(3)
        setup(@chessboard)
        
        puts "Let's start playing chess right now".light_blue
        current_player = player_1
        loop do
            @chessboard.display
            current_player.show_captured_piece
            puts "It's #{current_player.name}'s turn"
            sleep(1)
            position_of_the_choosed_piece = current_player.choose_a_piece_to_move(@chessboard)

            array_index_positions = convert(position_of_the_choosed_piece)
            @chessboard.active_piece = @chessboard.data[array_index_positions[0]][array_index_positions[1]]
            
         
            @chessboard.display
            current_player.show_captured_piece
            do_break = false
            loop do
                new_position = current_player.choose_a_position_to_move(@chessboard.active_piece)
                sleep(1)
                array_indexes_of_new_positions = convert(new_position)
                # Check if the position of the choosed piece is included inside the active_piece's attack_moves
        
                if @chessboard.active_piece.attack_moves.include?(array_indexes_of_new_positions)
                    the_attacked_piece = @chessboard.data.dig(array_indexes_of_new_positions[0], array_indexes_of_new_positions[1])

                    if the_attacked_piece.class.name == "King"
                        do_break = true 
                        puts "CHECKMATE".light_green
                        puts "Congratulations #{current_player.name}, you win!!!".light_green
                        break
                    end


                    # Capture the enemy's piece
                    @chessboard.remove(the_attacked_piece)
                    the_attacked_piece.position = nil
                    current_player.captured_pieces << the_attacked_piece

                    #remove the active piece with old position
                    @chessboard.remove(@chessboard.active_piece)

                    # Add the active piece to the new position
                    @chessboard.active_piece.position = array_indexes_of_new_positions
                    @chessboard.add(@chessboard.active_piece)
                    @chessboard.active_piece = nil
                    
                    break

                # Check if the position of the choosed piece is included inside the active_piece's allowed_moves
                elsif @chessboard.active_piece.allowed_moves.include?(array_indexes_of_new_positions)

                    #remove the active piece with old position
                    @chessboard.remove(@chessboard.active_piece)
                    # Add the active piece with the new position
                    @chessboard.active_piece.position = array_indexes_of_new_positions
                    @chessboard.add(@chessboard.active_piece)
                    @chessboard.active_piece = nil
                    break
                else
                    puts "WARNING, you can't move this piece there".light_red
                    redo
                end
            end
           break if do_break
            current_player == player_1 ? current_player = player_2 : current_player = player_1
        end
    end


    # convert player inputs to arrays locgic
    def convert(input)
        input_array = input.split("")
        dict_alpha = {
            :a => 0,
            :b => 1,
            :c => 2,
            :d => 3,
            :e => 4,
            :f => 5,
            :g => 6,
            :h => 7
        }
        dict_digit = {
            1 => 7,
            2 => 6,
            3 => 5,
            4 => 4,
            5 => 3,
            6 => 2,
            7 => 1,
            8 => 0
        }
        return [dict_digit[input_array[1].to_i], dict_alpha[input_array[0].to_sym]]
        
    end

end

game = ChessGame.new
game.play_with_two_ai

chessboard = ChessBoard.new



# setup(chessboard)
# chessboard.active_piece = chessboard.data.dig(3, 3)
# p chessboard.active_piece.attack_moves
# p chessboard.active_piece.allowed_moves
# chessboard.display
