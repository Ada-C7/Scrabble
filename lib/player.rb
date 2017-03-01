require_relative 'scrabble'

module Scrabble

class Player
  attr_reader :name
  attr_accessor :plays, :score

  def initialize(name)
    @name = name
    @plays = []
    @score = 0
  end

  def play(word)
    return false if won?
    @plays << word
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
