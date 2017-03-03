require_relative "scrabble"

module Scrabble
  class Player
    attr_reader :name, :plays, :tiles

    def initialize(name)
      raise ArgumentError.new("Invalid argument for name") if name.class != String
      @name = name
      @plays = []
      @tiles = []
    end

    def play(word)
      raise ArgumentError.new("Invalid argument for word") if word.class != String
      raise ArgumentError.new("Invalid data type entered for word") if word !~ /^[a-zA-Z]{0,7}$/
      if won?
        return false
      else
        @plays << word

        (word.length).times do |letter|
          @tiles.delete(letter)
        end

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
      return Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      scores = @plays.map{ |word| Scoring.score(word) }
      return scores.max
    end

    def draw_tiles(tile_bag)
      num = 7 - @tiles.length
      if tile_bag.tiles_remaining < num
        @tiles = tile_bag.draw_tiles(tile_bag.tiles_remaning)
      else
        @tiles = tile_bag.draw_tiles(num)
      end
    end
  end
end
