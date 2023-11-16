def show_saved_names
    data_directory = Dir.glob("chessgame_data/*.txt")
    data_directory.each { |path| puts File.basename(path).chomp(".txt") }
end

def choose_name
    puts "What is the name you saved?"
        name = gets.chomp

    if File.exist? "chessgame_data/#{name}.txt"
        puts "We found your progress, You can continue where you left off".light_green
        file = open("chessgame_data/#{name}.txt", 'r')
        loaded_game = Marshal.load(file.read)
        option = loaded_game.option
        if option == "1"
            loaded_game.human_vs_human
        elsif option == "2"
            loaded_game.human_vs_ai
        else
            loaded_game.ai_vs_ai
        end
    else
        puts "This name doesn't exist in our database".light_red
    end
end