class Hangman

  attr_reader :word, :count

  def initialize(word, count)
    @word = word
    @count = count
    @win = false
    @lettersGuessed = Array.new()

  end 
  
  def gameOver?
     @win || @count == 0
  end
  
  
  def gameWon?
     @win
  end 
  
  # return 0 if letter is not in word
  # otherwise, return the number of times the letter 
  # appears in the word
  def guess(letter)
    # Push the letter onto the array if doesn't already exist
    # Check to see if the letter has already been guessed
    if @lettersGuessed.include?(letter) == false
      @lettersGuessed.push(letter)
    end
    letterAppears = 0
    if @word.include?(letter.upcase) || @word.include?(letter.downcase)
      @word.each_char {
        |ch|
        if ch == letter.upcase || ch == letter.downcase
          letterAppears += 1
        end
      }
      return letterAppears
    else
      # If the letter does not appear, deduct 1 from count and return 0
      @count -= 1
      return 0
    end
  end 
  
  # return one of the letters in the word 
  # that has not been guessed 
  def hint()
  
  end 
  
  # return a string 
  # if a letter has not been guessed, return _ (underscore)
  # the string should contain a space between letters and 
  # underscores for readability.
  # Example:  if the word is cookie, and o and e have been guessed
  #   return the string "_ o o _ _ e"
  def display()
    displayString = ""
    @word.each_char { 
      displayString << "_ "
    }
    return displayString
  end
 
end


