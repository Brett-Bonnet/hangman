require 'yaml'

class Game
 include Tools

  def initialize
    reset
    greet
  end
  
  def reset
    @game_type = "N"    
    @answer = []
    @guesses = []
  end
  
  def saved_game_exists?
   true unless File.size?("saves.yaml") == nil
  end

  def greet
    puts "Welcome to Hangman!"
    puts "-------------------"
    puts "The object is simple: guess the letters in the mystery word one by one until either you guess them all, or you run out of turns!"
    puts "-------------------"
    if saved_game_exists?
      puts "Looks like there's a saved game! Load saved game? (Type Y/N)"
      @game_type = gets.chomp.to_s
      play(@game_type)
    else
      play(@game_type)
    end
  end

  def get_answer
    @answer = Answer.new.display.split('')
  end

  def play(game_type)
   if @game_type == "Y" || @game_type == "y"
      load_state
      play_game
   else
      puts "Alright let's start the game!"
      get_answer
      @game_board = Board.new(@answer)
      play_game      
    end

  end

  def play_game
   @attempts_left = @game_board.get_attempts
    loop do
      prompt_letter
      check_letter
      break if winner?
      if @attempts_left == 1
        puts "Better luck next time!"
        puts "The word was \"#{@answer.join("")}\""
        play_again?
      end
      @attempts_left -= 1
      end
  end

  def prompt_letter
    @guess = ""
    display
    puts "Enter a letter or Type 'save' to save game"
    @guess = gets.chomp.to_s.downcase
    if @guess == "save"
      @game_board.correct_attempts
      save_state 
      exit  
    else
    end
  end

  def check_letter
    @game_board.check_letter(@guess)
  end

  def display
    @game_board.display_board
  end

  def winner?
     if @game_board.check_answer
       display
       puts "You Win!"
       play_again?
        true
      else
        false
      end
  end

  def play_again?
    puts "Would you like to play again?"
    to_restart = gets.chomp.to_s
    if to_restart == "Y" || to_restart == "y"
      Game.new
    else
      puts "Thanks for playing! See ya next time!"
      exit
    end
  end



end
