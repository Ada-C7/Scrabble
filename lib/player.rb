
require_relative 'scoring'
module Scrabble

  class Player
    attr_reader :name, :plays

    def initialize(name)
      raise ArgumentError unless name.class == String
      @name = name
      @plays = []
      @total = 0
      @highest_word
      @highest_score
    end

    def play(word)
      return false if won?
      @plays << word
      score = Scrabble::Scoring.score(word)
      total_score(score)
      return score
    end

    def total_score(score)
      @total += score
    end

    def won?()
      @total >= 100 ? true : false
    end

    def highest_scoring_word
      @highest_word = Scrabble::Scoring.highest_score_from(@plays)
      return @highest_word
    end

    def highest_word_score
      @highest_score = Scrabble::Scoring.score(@highest_word)
      return @highest_score
    end

  end
end
#
# game = Scrabble::Player.new("Ada")
# puts game.play("hello")
# puts game.play("hi")
# puts game.play("elephant")
# puts game.play("algebra")
# puts game.highest_scoring_word
