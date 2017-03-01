require_relative 'scoring'

module Scrabble
  class Player
    attr_reader :name, :plays, :total_score
    # :highest_word_score

    def initialize(name)
      @name = name
      @plays =[]
      @total_score = 0
      # @highest_word_score = 0
    end

    def play(word)
      return false if won?
      score = Scoring.score(word)
      @plays << word
      @total_score += score

      # highest_scoring_word
      return score
    end

    def highest_scoring_word
      word = Scoring.highest_score_from(@plays)
      # @highest_word_score = Scoring.score(word)
      return word
    end

    def highest_word_score
      return Scoring.score(highest_scoring_word)
    end

    def won?
      return @total_score > 100
    end

  end
end

# player = Scrabble::Player.new("Mary")
#
# # player.highest_scoring_word
# puts "#{player.highest_word_score}"
