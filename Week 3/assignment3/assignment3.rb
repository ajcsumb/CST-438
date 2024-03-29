class Hangman

  attr_reader :word, :count

  def initialize(word, count)
    @word = word
    @count = count
    @win = false
    # An array to hold the letters guessed
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
    # Strip whitespace and downcase the letter
    letterModified = letter.downcase.strip
    # Push the letter onto the array if doesn't already exist
    # Check to see if the letter has already been guessed
    if @lettersGuessed.include?(letterModified) == false
      @lettersGuessed.push(letterModified)
    end
    # Show how many times the letter appears
    letterAppears = 0
    if @word.include?(letterModified.upcase) || @word.include?(letterModified.downcase)
      @word.each_char {
        |ch|
        if ch == letterModified.upcase || ch == letterModified.downcase
          letterAppears += 1
        end
      }

      # Check to see if the user has won
      checkGameStatus?

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
    # Check the letters guessed array, versus the word and determine which one has not been shown
    @word.each_char {
      |ch|
      # If the letter in the word does exist in the @lettersGuessed array, then return it as a hint
      if @lettersGuessed.include?(ch) == false
        # Add it to lettersGuessed array
        @lettersGuessed.push(ch)
        # Subtract one from count
        @count -= 1

        # Check to see if the user has won
        checkGameStatus?

        return ch
      end
    }
  end 
  
  # return a string 
  # if a letter has not been guessed, return _ (underscore)
  # the string should contain a space between letters and 
  # underscores for readability.
  # Example:  if the word is cookie, and o and e have been guessed
  #   return the string "_ o o _ _ e"
  def display()
    # The string to return
    displayString = ""
    # An easy variable to hold the length of the word
    length = @word.length

    # Check to see if lettersGuessed has anything
    if @lettersGuessed.length == 0
      # Build the empty displayString
      for i in 0...length
        if i == 0
          displayString = "_"
        else
          displayString << " _"
        end
      end
    else
      # If there have been letters guessed by the user, check to see if they match the word and construct the string
      for i in 0...length
        # Check to see if the letter has been guessed
        if @lettersGuessed.include?(@word[i].downcase) || @lettersGuessed.include?(@word[i].upcase)
          # If it has and this is the first position, just add the letter
          if i == 0
            displayString = @word[i]
          else
            # If it has been guessed, add it with a space, then add the letter
            displayString << " " << @word[i]
          end
        else
          if i == 0
            displayString = "_"
          else
            displayString << " _"
          end
        end
      end
    end
    # Return the displayString
    return displayString
  end

  # Private Methods
  private

  def checkGameStatus?
    count = 0
    # Check to see if the user has made all the correct guesses
    @word.each_char {
      |ch|
      if @lettersGuessed.include?(ch.downcase)
        count += 1
      end
    }

    # If the amount in count matches the length of the word then we know the user won.
    if count == @word.length
      @win = true
    end
  end
 
end


