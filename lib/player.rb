
require_relative 'scoring'
module Scrabble

  class Player
    attr_reader :name, :plays

    def initialize(name)
      raise ArgumentError unless name.class == String
      @name = name
      @plays = []
      @total = 0
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

  end
end
#
# game = Scrabble::Player.new("Ada")
# puts game.play("hello")
