require_relative 'scrabble'

module Scrabble

class Player
  attr_reader :name
  attr_accessor :play, :score

  def initialize(name)
    @name = name
    @play = []
    @score = 0
  end

  def play(word)
    return false if won? 
    @play << word
    return Scoring.score(word)
  end

  def total_score
  end

  def won?
    return true if @score >= 100
  end

  def highest_scoring_word
  end

  def highest_word_score(word)
  end

end



end
