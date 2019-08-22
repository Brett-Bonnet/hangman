require 'yaml'

module Tools

  def save_state
    string = {:answer => @answer, :game_board => @game_board, :attempts_left => @attempts_left, :wrong_letters => @wrong_letters}
    File.open("saves.yaml", "w") {|file| file.write(string.to_yaml)}
    puts "Your game has been saved! See ya next time!"  
  end
    
  def load_state
    @load_state = YAML.load_file("saves.yaml")
    @answer = @load_state[:answer]
    @game_board = @load_state[:game_board]
    @attempts_left = @load_state[:attempts_left]
    @wrong_letters = @load_state[:wrong_letters]
  end
end


 
