require_relative 'scoring'

module Scrabble
  class Player < Scoring
    attr_reader :name, :plays
    def initialize(name)
      @name = name
      @plays = [""]
    end

    def won?
      return false unless total_score > 100
    end

    def play(word)
      return false if won?
      raise ArgumentError.new "This requires a string" if word.class != String
      @plays << word
      return self.class.score(word)
    end

    def total_score
      total = 0
      @plays.each { |word| total += self.class.score(word) }
      return total
    end

    def highest_scoring_word
      return self.class.highest_word(@plays)
    end

    def highest_word_score
      return self.class.score(highest_scoring_word)
    end

  end
end
