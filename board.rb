

class Board


  def initialize(answer)
    reset
    @answer = answer    
    new_board
  end

  def reset
    @game_state = []
    @answer = []
    @wrong_letters = []
  end

  def new_board
    @answer.length.times {@game_state.push("_")}
    calculate_attempts
  end

  def calculate_attempts
    @attempts_left = @answer.length + 3
  end

  def get_attempts
    return @attempts_left
  end

  def correct_attempts
    @attempts_left += 1
  end


  def display_board
     puts "\n"
     puts "|#{@game_state.join("|")}|"
     puts "Wrong letters: #{@wrong_letters.join(", ")} | Attempts remaining: #{@attempts_left}"
     @attempts_left -= 1
  end

  def check_letter(guess)
     @answer.each_with_index do |letter, index|
       if letter == guess
        @game_state[index] = guess
        else
      end
     end 
    get_wrong_letters(guess)
  end

  def check_answer
    if @game_state == @answer
     true
    else
     false
   end
  end

  def get_wrong_letters(guess)
     if @game_state.none?  {|letter| letter == guess}
       @wrong_letters.push(guess)
     end
  end



end
