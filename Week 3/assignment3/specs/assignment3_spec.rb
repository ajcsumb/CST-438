require_relative '../assignment3.rb'


RSpec.describe Hangman do 

  it 'check for required methods' do
    g = Hangman.new('cookie', 3)
    expect(g).to respond_to(:gameOver?)
    expect(g).to respond_to(:gameWon?)
    expect(g).to respond_to(:guess)
    expect(g).to respond_to(:hint)
    expect(g).to respond_to(:display)
  end 
  
   it 'new game' do
    g = Hangman.new('cookie', 3)
    expect(g.gameOver?).to be false
    expect(g.gameWon?).to be false
    expect(g.word).to eq 'cookie'
    expect(g.count).to eq 3
    
    g = Hangman.new('tomcat', 5)
    expect(g.gameOver?).to be false
    expect(g.gameWon?).to be false
    expect(g.word).to eq 'tomcat'
    expect(g.count).to eq 5
    expect(g.display).to eq '_ _ _ _ _ _'
  end 

  # Check to see if the user lost the game.
  it 'should make the player lose the game' do
    g = Hangman.new('computer', 3)
    g.guess('k')
    expect(g.display).to eq '_ _ _ _ _ _ _ _'
    g.guess('l')
    expect(g.display).to eq '_ _ _ _ _ _ _ _'
    g.guess('n')
    expect(g.display).to eq '_ _ _ _ _ _ _ _'
    expect(g.gameWon?).to be false
  end

  # Check to see when the user enters in a number or a symbol
  it 'should accept the symbol or number and deduct from count' do
    g = Hangman.new('help', 5)
    g.guess('~')
    expect(g.count).to eq 4
    expect(g.display).to eq '_ _ _ _'
    g.guess('3')
    expect(g.count).to eq 3
    expect(g.display).to eq '_ _ _ _'
  end

  # Check to see if the user uses hints all the way through
  it 'should allow the user to win the game using hints if the count is smaller than the word' do
    g = Hangman.new('sell', 8)
    g.hint
    g.hint
    g.hint
    g.hint
    expect(g.gameWon?).to be true
  end

  # Check to see if capitalization matters
  it 'should not care about caps in either the word or letter entered by the user' do
    g = Hangman.new('SpECific', 3)
    g.guess('e')
    expect(g.display).to eq '_ _ E _ _ _ _ _'
    g.guess('P')
    expect(g.display).to eq '_ p E _ _ _ _ _'
  end

  # Check to see if the user accidentally enters whitespace and a character, it still accepts it.
  it 'should accept a character and an accidental space such as " c" or "c "' do
    g = Hangman.new('tech', 3)
    g.guess(' e')
    expect(g.guess(' e')).to eq 1
    expect(g.display).to eq '_ e _ _'
    g.guess('       t')
    expect(g.display).to eq 't e _ _'
    g.guess('C   ')
    expect(g.guess('C   ')).to eq 1
    expect(g.display).to eq 't e c _'
    g.guess('h')
    expect(g.display).to eq 't e c h'
    expect(g.gameWon?).to be true
  end

  
end

