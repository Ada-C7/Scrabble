require_relative 'scoring'
require_relative 'tile_bag'

module Scrabble
  class Player
    attr_reader :name, :plays, :tiles
    def initialize(name)
      @name = name
      @plays = []
      @tiles = []
      @tile_bag = TileBag.new
    end

    def won?
      false unless total_score > 100
    end

    def tile_bag_draw(num)
      @tile_bag.draw_tiles(1)
    end

    def draw_tiles
      until @tiles.length == 7
        @tiles << tile_bag_draw(1)[0]
      end
    end

    def score(name)
      Scoring.score(name)
    end

    def highest_word(data)
      Scoring.highest_word(data)
    end

    def play(word)
      return false if won?
      raise ArgumentError.new "This requires a string" if word.class != String
      @plays << word
      score(name)
    end

    def total_score
      total = @plays.sum { |word| score(word) }
    end

    def highest_scoring_word
      highest_word(@plays)
    end

    def highest_word_score
      score(highest_scoring_word)
    end

  end
end
