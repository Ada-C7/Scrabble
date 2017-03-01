require_relative 'scoring.rb'

module Scrabble
  class Player

    def initialize name
      @name = name
    end

    def plays
      #plays: returns an Array of the words played by the player
    end

    def play word
      #play(word): Adds the input word to the plays Array
      # Returns false if player has already won
      # Returns the score of the word
    end

    def total_score
      # Returns the sum of scores of player words
    end

    def won?
      # If the player has over 100 points, returns true, otherwise returns false
    end

    def highest_scoring_word 
      # Returns the highest scoring played word
    end

    def highest_word_score
      # Returns the highest_scoring_word score
    end

  end
end
