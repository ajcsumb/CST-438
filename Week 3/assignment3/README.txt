assignment3  readme

------------------------------------------------------------------


Complete the class in assignment3.rb file. 
Do not change the method signatures as this 
will cause your code to fail with the auto grader.

As you complete the Hangman class, you will also 
practice test driven development (TDD) by completing 
the specs/assignment3_spec.rb test cases.

Run your program by running the solution.rb file
$ ruby solution.rb

To run the test cases use the command 
$ rspec specs --format doc


For development purposes, we enter the word to be 
guessed.  In a real game, we would read a random 
word from a file.

Each guess can be a single letter or  the user may enter
"hint" to ask for a letter to be revealed.

An incorrect guess or using a "hint" will subtract
from the guesses remaining.  

If there is only one guess
remaining, the user cannot do a hint.

If the guesses remaining becomes 0, the game is over
and the user has lost.

  ------------------------------------------------------------------

An example output is the following

$ ruby solution.rb 

Enter the word to guess
cookie
The word is _ _ _ _ _ _
You have 6 guesses remaining.
Enter a letter or the command hint
c
There is one c in the word.
The word is c _ _ _ _ _
You have 6 guesses remaining.
Enter a letter or the command hint
hint
The word is c o o _ _ _
You have 5 guesses remaining.
Enter a letter or the command hint
hint
The word is c o o k _ _
You have 4 guesses remaining.
Enter a letter or the command hint
hint
The word is c o o k i _
You have 3 guesses remaining.
Enter a letter or the command hint
e
There is one e in the word.
The word is c o o k i e
Congratulations!!!  You win.

  ------------------------------------------------------------------

Another example 

$ ruby solution.rb
Enter the word to guess
medicine
The word is _ _ _ _ _ _ _ _
You have 6 guesses remaining.
Enter a letter or the command hint
a
There are no a's in the word.
The word is _ _ _ _ _ _ _ _
You have 5 guesses remaining.
Enter a letter or the command hint
e
There are 2 es in the word.
The word is _ e _ _ _ _ _ e
You have 5 guesses remaining.
Enter a letter or the command hint
i
There are 2 is in the word.
The word is _ e _ i _ i _ e
You have 5 guesses remaining.
Enter a letter or the command hint
o
There are no o's in the word.
The word is _ e _ i _ i _ e
You have 4 guesses remaining.
Enter a letter or the command hint
u
There are no u's in the word.
The word is _ e _ i _ i _ e
You have 3 guesses remaining.
Enter a letter or the command hint
b
There are no b's in the word.
The word is _ e _ i _ i _ e
You have 2 guesses remaining.
Enter a letter or the command hint
l
There are no l's in the word.
The word is _ e _ i _ i _ e
You have 1 guesses remaining.
Enter a letter or the command hint
m
There is one m in the word.
The word is m e _ i _ i _ e
You have 1 guesses remaining.
Enter a letter or the command hint
n
There is one n in the word.
The word is m e _ i _ i n e
You have 1 guesses remaining.
Enter a letter or the command hint
p
There are no p's in the word.
Sorry.  You lost.  The word was medicine

  ------------------------------------------------------------------
  
Submit 2 files for this assignment.
   assignment3.rb 
   assignment3_spec.rb 
   
50% of your score on this assignment will be to 
correctly implement the methods of Hangman class 
and pass the tests that we have written.

The other 50%  will be based on your test cases.
We will run your tests against several incorrect versions
of Hangman.  If you tests detect all the errors then 
you get full points. 
