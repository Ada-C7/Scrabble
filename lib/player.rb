require_relative "scoring"
require_relative "tilebag"

module Scrabble
  class Player < Scoring
    attr_reader :name, :plays, :tiles
    def initialize(name, tile_bag = nil)
      raise ArgumentError.new("Argument must be a string, the name of the player") if name.class != String
      @name = name
      @plays = []
      @tiles = []

    end

    def play(word)
      if won?
        return false
      else
        @plays << word
        return Scoring.score(word)
      end
    end

    def total_score
      @plays.map { |word| Scoring.score(word)}.sum
    end

    def won?
      total_score > 100 ? true : false
    end

    def highest_scoring_word
      Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      Scoring.score(highest_scoring_word)
    end

    def draw_tiles(tile_bag)
      new_tiles_needed = 7 - @tiles.length
      @tiles += tile_bag.draw_tiles(new_tiles_needed)
    end

  end # End of class Player
end # End of module Scrabble
