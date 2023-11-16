require_relative 'lib/game'
require_relative 'serializable'

loop do
    puts "Please choose from the following: 
                                    1) Human vs Human
                                    2) Human vs AI
                                    3) AI vs AI
                                    4) Load an old game
                                    5) View names from the collection library"
    answer = gets.chomp
    game = ChessGame.new
    if answer == "1"
        game.play(answer)
    elsif answer == "2"
        game.play(answer)
    elsif answer == "3"
        game.play(answer)
    elsif answer == "4"
        choose_name
    elsif "5"
        show_saved_names
        choose_name
    else
        puts "This option doesn't exist"
        redo
    end

    puts "Do you want to play again[y/n]"
    play_again = gets.chomp

    if play_again == "y"
        redo
    else
        puts "Thank you for playing!"
        puts "Don't hesitate to follow me on GitHub: odilsonjs"
        break
    end
end
