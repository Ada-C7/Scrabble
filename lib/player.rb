require_relative 'scrabble'

module Scrabble

class Player
  attr_reader :name
  attr_accessor :plays, :score

  def initialize(name)
    @name = name
    @plays = []
    @score = 0
    @score_array = []

  end

  def play(word)
    return false if won?
    @plays << word
    @score_array << Scoring.score(word)
    return Scoring.score(word)
  end

  def total_score
    return @score_array.reduce(:+)
  end

  def won?
    return ((@score >= 100) ? true : false)
  end

  def highest_scoring_word
    return Scoring.highest_score_from_array(@plays)
  end

  def highest_word_score
    return Scoring.score(highest_scoring_word)
  end

end



end
