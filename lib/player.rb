
require_relative 'scoring'
module Scrabble

  class Player
    attr_reader :name, :plays

    def initialize(name)
      raise ArgumentError unless name.class == String
      @name = name
      @plays = []
    end

    def play(word)
      # return false if won?
      @plays << word
      return Scrabble::Scoring.score(word)
    end

  end
end
#
# game = Scrabble::Player.new("Ada")
# puts game.play("hello")
