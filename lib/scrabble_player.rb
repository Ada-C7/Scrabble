require_relative 'scrabble_scoring'

module Scrabble
  class Player
    attr_accessor :name
    def initialize(name)
      @name = name
      @played_words = []
      @total = []
    end

    def play(word)
      # @played_words = []
      #empty array for the number of plays
      # raise ArgumentError.new("You already won!") if @total.inject(:+) > 100
      @total << Scrabble::Scoring.score(word)
      @played_words << word
      return @played_words
    end

    def plays
      return @played_words
    end

    def total_score
      return @total.inject(:+)
    end

    def highest_scoring_word
      return Scrabble::Scoring.highest_score_from(@played_words)
    end

    def won?
      total = @total.inject(:+)
      if total > 100
        return true
      else
        return false
      end
    end

    def tiles(num)
      Scrabble::TileBag.draw_tiles(num)
      raise ArgumentError.new("You can only play 7 tiles max") if num > 7
    end

    #draw_tiles(tile_bag) fills tiles array until it has 7 letters from the given tile bag
    def draw_tiles(tile_bag)
      tiles = []
      tiles << Scrabble::TileBag.draw_tiles(7)
    end


  end
end
