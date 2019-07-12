require_relative "assignment3.rb"

puts "Enter the word to guess"
word = gets().chomp! 

hangman = Hangman.new(word, 6)

until hangman.gameOver?  
  puts "The word is "+ hangman.display
  puts "You have #{hangman.count} guesses remaining."
  puts "Enter a letter or the command hint"
  letter = gets().chomp!
  if letter == 'hint'
    if hangman.count == 1
      puts "You cannot take a hint when there is only one guess left."
    else 
      hangman.hint
    end
  else 
    if letter.length != 1 
      puts "Not valid guess.  Must be single letter." 
    else 
      cnt = hangman.guess(letter)
      if cnt == 1 
        puts "There is one #{letter} in the word."
      elsif cnt > 1
        puts "There are #{cnt} #{letter}s in the word."
      else 
        puts "There are no #{letter}'s in the word."
      end 
    end 
  end
end

if hangman.gameWon?
  puts "The word is "+ hangman.display
  puts "Congratulations!!!  You win."
else 
  puts "Sorry.  You lost.  The word was "+word
end
