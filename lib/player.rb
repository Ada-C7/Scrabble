
require_relative 'score'
require 'awesome_print'


module Scrabble
  class Player
    attr_reader :name, :plays, :winner

    def initialize(name)
      @name = name
      @plays = []
      @winner = ""
    end

    def play(word)
      return false if won?
      @plays << word
      Scoring.score(word)
    end

    def total_score
      return 0 if @plays == []
      player_score = @plays.map {| word | Scoring.score(word)}
      player_score.inject { | sum, points | sum + points }
    end

    def won?
      return total_score > 100 ? true : false
    end

    def highest_scoring_word
      @winner = Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      Scoring.score(@winner)
    end
  end
end
