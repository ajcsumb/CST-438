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
  
end

