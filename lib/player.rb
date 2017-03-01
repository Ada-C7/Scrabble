require_relative '../lib/score'

module Scrabble
  class Player
    include Scrabble
    extend Scrabble
    attr_reader :name ,:plays
    def initialize(name, plays=[])
      @name = name
      @plays = plays
      @total_score = 0

    end

    def won?(score)
      score > 100
    end

    def highest_scoring_word
      return Scrabble::Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      # @plays.max { |word| Scrabble::Scoring.score(word) }
      100
    end


  end
end

# player1 = Scrabble::Player.new("Bob", ["ox", "rat"])
# p player1.highest_scoring_word
