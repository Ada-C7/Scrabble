module Scrabble

  class Player
  attr_reader :name, :total_score

    def initialize(name)
      raise ArgumentError.new("You must enter a name with letters.") if name.class != String
      @name = name
      @plays = [] #returns an Array of the words played by the playera
      @total_score = 0 #total_score: Returns the sum of scores of played words
      @tiles = []
    end

    def tiles
      #tiles a collection of letters that the player can play (max 7)
    end

    def draw_tiles(tile_bag)
      #draw_tiles(tile_bag) fills tiles array until it has 7 letters from the given tile bag
    end

    def plays
      raise ArgumentError.new("You haven't played any words yet!") if @plays.empty?
      @plays
    end

    #won?: If the player has over 100 points, returns true, otherwise returns false
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

    #highest_scoring_word: Returns the highest scoring played word
    def highest_scoring_word
      Scrabble::Scoring.highest_score_from(@plays)
    end

    #highest_word_score: Returns the highest_scoring_word score
    def highest_word_score
      Scrabble::Scoring.score(highest_scoring_word)
    end

  end
end
