require_relative 'scoring'

module Scrabble
  class Player
    attr_reader :name, :plays, :total_score

    def initialize(name)
      @name = name
      @plays =[]
      @total_score = 0
    end

    def play(word)
      return false if won?
      score = Scoring.score(word)
      @plays << word
      @total_score += score

      return score
    end

    def highest_scoring_word

      return Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      return Scoring.score(highest_scoring_word)
    end

    def won?
      if @total_score > 100
        true
      else
        false
      end
    end

  end
end
