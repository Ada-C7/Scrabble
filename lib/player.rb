
require_relative 'tilebag'
require_relative 'score'
require 'awesome_print'

module Scrabble
  class Player
    attr_reader :name, :plays, :tiles

    def initialize(name, plays = nil, tiles = nil)
      @name = name
      @plays = plays
      @plays ||= []
      @tiles ||= []
    end

    def play(word)
      return false if won?
      @plays << word
      Scoring.score(word)
    end

    def total_score
      return 0 if @plays == []
      player_score = @plays.map {| word | Scoring.score(word)}
      player_score.inject { | sum, points | sum + points }
    end

    def won?
      return total_score > 100 ? true : false
    end

    def highest_scoring_word
      Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      begin
        word = highest_scoring_word
      rescue ArgumentError
        return 0
      end
      Scoring.score(word)
    end

    def tiles
      @tiles
    end

    def draw_tiles(tile_bag)
      draws = 7 - @tiles.length
      @tiles += tile_bag.draw_tiles(draws)
    end

  end
end



# player = Scrabble::Player.new("Ada")
# bag = Scrabble::TileBag.new
#
# player.draw_tiles(bag)
# puts player.tiles
