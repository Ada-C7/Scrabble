require_relative 'scoring'

module Scrabble
  class Player
    attr_reader :name, :plays
    def initialize(name)
      @name = name
      @plays = [""]
    end

    def won?
      return false unless total_score > 100
    end

    def score(name)
      Scoring.score(name)
    end

    def highest_word(data)
      Scoring.highest_word(data)
    end

    def play(word)
      return false if won?
      raise ArgumentError.new "This requires a string" if word.class != String
      @plays << word
      return score(name)
    end

    def total_score
      total = 0
      @plays.each { |word| total += score(word) }
      return total
    end

    def highest_scoring_word
      return highest_word(@plays)
    end

    def highest_word_score
      return score(highest_scoring_word)
    end

  end
end
