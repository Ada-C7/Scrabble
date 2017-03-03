require_relative 'scoring'
require_relative 'tile_bag'
module Scrabble
  class Player

    attr_reader :name, :plays
    def initialize(name)
      raise ArgumentError.new("Name must be a string") if name.class != String
      @name = name
      @plays = []
      @tiles = [] # tiles that player has right now
    end

    def play(word)
      return false if won?
      score = Scrabble::Scoring.score(word)
      @plays << word
      return score
    end

    def total_score
      total = 0
      @plays.each do |word|
        total += Scrabble::Scoring.score(word)
      end
      total
    end

    def won?
      return true if total_score >= 100
      false
    end

    def highest_scoring_word
      Scrabble::Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      Scrabble::Scoring.score(highest_scoring_word)
    end

    def tiles
      @tiles
    end

    def draw_tiles(tile_bag)
      if tile_bag.class != Scrabble::TileBag
        raise ArgumentError.new("parameter must be an instance of TileBag")
      end
      if tiles.length < 7
        @tiles += tile_bag.draw_tiles(7 - tiles.length)
      end
      @tiles
    end
  end # end of class
end # end of module
