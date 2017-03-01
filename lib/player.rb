module Scrabble

  class Player
  attr_reader :name, :plays, :total_score

    def initialize(name)
      @name = name
      @plays = [] #returns an Array of the words played by the player
      @total_score = 0 #total_score: Returns the sum of scores of played words
    end

    def won?
      @total_score >= 100 ? true : false
    end

    def play(word)
      # Returns false if player has already won
      return false if won?
      score = Scrabble::Scoring.score(word)
      @total_score += score
      # play(word): Adds the input word to the plays Array
      @plays << word
      # Returns the score of the word
      return score
    end


    #total_score: Returns the sum of scores of played words
    #won?: If the player has over 100 points, returns true, otherwise returns false
    #highest_scoring_word: Returns the highest scoring played word
    #highest_word_score: Returns the highest_scoring_word score

  end
end
