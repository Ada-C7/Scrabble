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
    Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      Scoring.score(highest_scoring_word)
    end

  end
end
