require_relative 'scoring.rb'

module Scrabble
  class Player

    def initialize name
      @name = name
      @plays = []
    end

    def play word
      return false if player.won?

      @plays << word
      return Scoring.score(word)
      #play(word): Adds the input word to the plays Array
      # Returns false if player has already won
      # Returns the score of the word
    end

    def total_score @plays
      scores = @plays.map { |word| Scoring.score(word) }
      return scores.sum
      # Returns the sum of scores of player words
    end

    def won?
      total_score > 100 ? true : false
      # If the player has over 100 points, returns true, otherwise returns false
    end

    def highest_scoring_word
      return Scoring.highest_score_from(@plays)
      # Returns the highest scoring played word
    end

    def highest_word_score
      Scoring.score(highest_scoring_word)
      # Returns the highest_scoring_word score
    end

  end
end
