require_relative 'scoring.rb'
require_relative 'tile_bag.rb'

module Scrabble
  class Player
    attr_accessor :name, :played_words, :max_score, :highest_scoring_word, :tiles
    # attr_accessor :tile_bag

    def initialize(name)
      @name = name
      @played_words = []
      @tiles = []
    end

    def draw_tiles(name_of_tile_bag)
      if @tiles.nil?
        @tiles << name_of_tile_bag.Scrabble::TileBag.draw_tiles(7)
        puts @tiles
      else
        @tiles << name_of_tile_bag.draw_tiles(7 - @tiles.length)
      end
    end

    def tiles
      # @tiles = Scrabble::TileBag.draw_tiles(num)
    end


    def plays
      @played_words
    end

    def play(word)
      if won?
        false
      else
        @played_words << word
        Scrabble::Scoring.score(word)
      end
    end

    def total_score
      @total_score = 0
      @played_words.each do |word|
        score = Scrabble::Scoring.score(word)
        @total_score += score
      end
      return @total_score
    end

    def best_word
      @highest_scoring_word = Scrabble::Scoring.highest_score_from(@played_words)
      @max_score = Scrabble::Scoring.score(@highest_scoring_word)
    end

    def won?
      total_score > 100 ? true : false
    end
  end
end

player = Scrabble::Player.new("Ada")
tiles = Scrabble::TileBag.new
p player.tiles
player.draw_tiles(tiles)
p player.tiles
# p player.tiles.length
# player.draw_tiles
