class CountLetters 

  # define an instance variable containing empty hash with key being the letter
  #  and value being the count of occurrences of the letter
  #  use Hash.new(0) to create empty hash table
  def initialize()
    @counts = Hash.new(0)
  end 
  
  # accessor for the hash
  def counts
     @counts
  end
  

  # given a filename, read the file and for each letter update the hash table  
  def analyzeFile(file)
    aFile = File.new(file, "r")
    if (aFile.size > 0)
      # Iterate over the file
      IO.foreach(file) do |letter|
        # Get rid of the \r\n from each line in the file
        moddedLetter = letter.chomp("\r\n")
        # Check to see if the letter exists in the hash
        if @counts.has_key?(moddedLetter)
          # If it has the key, increment the letters count
          @counts[moddedLetter] += 1
        else
          # If it does not have the key, store it with an inital count value of 1
          @counts.store(moddedLetter, 1)
        end
      end
    else
      return nil
    end
  end  
  
  # return an array of lists  
  # [ [letter, count], [letter, count], ... [letter, count] ]
  #  Only letters with count >0 are returned.
  #  Array is in decreasing order by count.
  def sortByCountDecreasing
    sorted = @counts.sort_by { |letter, count| -count}
    return sorted
  end
  
  # return an array  [  string, count ]
  #  string is the letter or letters that occur the most
  #  count of occurrences
  def highestfrequency
    if @counts.length > 0
      # Sort the hash
      sorted = @counts.sort_by { |letter, count| -count}
      # Setup new variables to construct the array
      newString = ""
      greatestVal = sorted[0][1]  # The count in the first array is the highest
      sorted.each {
        |a|
        # If the count value of the inner array equals the greatest value
        if a[1] == greatestVal
          # Add the letter to the new string
          newString += a[0]
        end
      }
      
      highestFreqArray = [newString, greatestVal]
      return highestFreqArray
    else
      return nil
    end
    
  end
  
  # return array of length 11. Each element  is [letter, count].  
  # [ ["A", count], ["B", count], ... , ["K", count] ] 
  # array is in order by letters
  def sortByLetter
     # Make an array of all the letters
     allLetters = ("A".."K").to_a
     # Clone the existing hash
     clonedHash = @counts.clone
     # Loop through the allLetters array and check to see if the letter exists
     # in the hash
     allLetters.each {
       |letter|
       # If the hash does not have the letter, store it with the value of 0
       if clonedHash.has_key?(letter) == false
         clonedHash.store(letter, 0)
       end
     }
     # Return clonedHash as a sorted array
     return clonedHash.sort
  end
  
end


