require 'open-uri'


class Answer


  def initialize
    populate_dictionary  
    pick_answer
  end
 
  def populate_dictionary
    url = "https://www.scrapmaker.com/data/wordlists/twelve-dicts/5desk.txt"
    words = open(url).read
    local_file = open("dictionary.txt", "w")
    local_file.write(words)
  end

  def pick_answer
    loop do
      possible_answer = File.readlines("dictionary.txt").sample.chomp.to_s.downcase
      if possible_answer.length > 5 && possible_answer.length < 12
        @answer = possible_answer
        break
      else redo
      end
    end
  end
  
  def display
    @answer
  end

end
