require_relative 'scoring.rb'

module Scrabble
  class Player
    attr_reader :name, :plays
    def initialize name
      raise ArgumentError.new "Name must be a string!" if name.class != String
      @name = name
      @plays = []
      @tiles = draw_tiles(7)
    end

    def tiles
      @tiles
    end

    def play word
      word_array = word.split('')
      raise ArgumentError.new "You don't have the right tiles!" if word_array != word_array & @tiles
    
      return false if won?

      @plays << word
      return Scoring.score(word)
      #play(word): Adds the input word to the plays Array
      # Returns false if player has already won
      # Returns the score of the word
    end

    def total_score
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

    def draw_tiles(tile_bag)
      raise ArgumentError.new "The argument must be a TileBag" if tile_bag.class != TileBag
      if @tiles.length < 7
       @tiles += tile_bag.draw_tiles(7-tiles.length)
      end
    end

  end # end of Class
end # end of Module
