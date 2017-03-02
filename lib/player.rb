require_relative 'scrabble'

module Scrabble

  class Player
    attr_reader :name, :plays, :score_array
    attr_accessor :score

    def initialize(name)
      raise ArgumentError.new "Player must have a valid name" if name.class != String
      @name = name
      @plays = []
      @score = 0
      @score_array = []
    end

    def play(word)
      raise ArgumentError.new "Word must be a valid word" if word.class != String
      plays << word
      word_score = Scoring.score(word)
      score_array << word_score
      return ((won?) ? false : word_score)
    end

    def total_score
      raise ArgumentError.new "No words have been played" if plays.length == 0
      return score_array.reduce(:+)
    end

    def won?
      raise ArgumentError.new "No words have been played" if plays.length == 0
      score = total_score
      return ((score >= 100) ? true : false)
    end

    def highest_scoring_word
      return Scoring.highest_score_from_array(plays)
    end

    def highest_word_score
      return score_array.max
    end

  end



end
