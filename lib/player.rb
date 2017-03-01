require_relative 'scoring'

module Scrabble
  class Player
    attr_reader :name, :played_words , :max_score , :highest_scoring_word

    def initialize(name)
      @name = name
      @played_words = []
    end

    def plays
      @played_words
    end

    def play(word)
      if won?
        false
      else
        @played_words << word
        Scrabble::Scoring.score(word)
      end
    end

    def total_score
      @total_score = 0
      @played_words.each do |word|
        score = Scrabble::Scoring.score(word)
        @total_score += score
      end
      return @total_score
    end

    def best_word
      @highest_scoring_word = Scrabble::Scoring.highest_score_from(@played_words)
      @max_score = Scrabble::Scoring.score(@highest_scoring_word)
    end

    def won?
      total_score > 100 ? true : false
    end

  end
end
