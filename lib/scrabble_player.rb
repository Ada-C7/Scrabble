require_relative 'scrabble_scoring'

module Scrabble
  class Player
    attr_accessor :name
    def initialize(name)
      @name = name
      @played_words = []
      @total = []
    end

    def play(word)
      # @played_words = []
      #empty array for the number of plays
      # raise ArgumentError.new("You already won!") if @total.inject(:+) > 100
      @total << Scrabble::Scoring.score(word)
      @played_words << word
      return @played_words
    end

    def plays
      return @played_words
    end

    def total_score
      return @total.inject(:+)
    end

    def highest_scoring_word
      return Scrabble::Scoring.highest_score_from(@played_words)
    end

    def won?
      total = @total.inject(:+)
      if total > 100
        return true
      else
        return false
      end
    end
  end
end

new_game = Scrabble::Player.new("allison")
new_game.play("hello")
new_game.play("how")
new_game.highest_scoring_word
new_game.won?
