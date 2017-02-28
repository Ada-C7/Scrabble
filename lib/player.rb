module Scrabble
  class Player
    attr_reader :name, :plays

    def initialize(name)
      @name = name
      @plays = []
    end

    def play(word)
      return false if won?
      @plays << word
      Scoring.score(word)
    end

    def total_score
      @plays.map { |word| Scoring.score(word) }.reduce(0, :+)
    end

    def won?
      total_score > 100
    end

    def highest_scoring_word
      @plays.max_by { |word| Scoring.score(word) }
    end
  end
end
