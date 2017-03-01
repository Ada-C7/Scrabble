
module Scrabble
  class Player

    attr_reader :name

    def initialize(name)
      @name = name
    end

    def plays
      # returns an array of the words played by the player
    end

    def play(word)
      # addst the input word to the plays array
      # false - if player won
      # returns score of the word
    end

    def total_score
      #sum of scores of played words
    end

    def won?
      # true if total score is more than 100
    end

    def highest_scoring_word
      # highest scoring played word will be returned
    end

    def highest_word_score
      # Score for highest scoring word will be returned
    end
  end
end
