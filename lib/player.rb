require_relative "scoring"

module Scrabble
  class Player
    attr_reader :name, :plays, :tiles

    def initialize(name)
      # Parameter must be a string
      raise ArgumentError.new("Invalid argument for name") if name.class != String
      @name = name
      @plays = []
      @tiles = []
    end

    def play(word)
      # Parameter must be a string
      raise ArgumentError.new("Invalid argument for word") if word.class != String

      # Passed string parameter must only contain letters
      raise ArgumentError.new("Invalid data type entered for word") if word !~ /^[a-zA-Z]{0,7}$/

      if won?
        # Already won case: returns false
        return false
      else
        # Not won yet case: return the score of the word
        # Deletes used tiles from the @tiles
        word.split("").each do |letter|
          @tiles.delete(letter)
        end

        # Adds the played word to the @plays
        @plays << word
        return Scoring.score(word)
      end
    end

    def total_score
      scores = @plays.map{ |word| Scoring.score(word) }
      return scores.reduce(0,:+)
    end

    def won?
      return total_score > 100 ? true : false
    end

    def highest_score_word
      # Calls the class method from Scrabble::Scoring
      return Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      # Calls the class method from Scrabble::Scoring within the loop
      scores = @plays.map{ |word| Scoring.score(word) }
      return scores.max
    end

    def draw_tiles(tile_bag)
      # Ensures that the player can only have upto 7 tiles at most at any given time
      num = 7 - @tiles.length

      # Ensures that the last draw happens regardless of the number of tiles left in the tile bag
      if tile_bag.tiles_remaining < num
        @tiles = tile_bag.draw_tiles(tile_bag.tiles_remaining)
      else
        @tiles = tile_bag.draw_tiles(num)
      end
    end
  end
end
