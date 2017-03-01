require_relative 'scrabble'

module Scrabble

class Player
  attr_reader :name
  attr_accessor :play

  def initialize(name)
    @name = name
    @play = []
  end

  def play(word)
  end

  def total_score
  end

  def won?
  end

  def highest_scoring_word
  end

  def highest_word_score(word)
  end

end



end
