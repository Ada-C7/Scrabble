require_relative 'scoring'
require_relative 'tile_bag'
module Scrabble
  class Player

    attr_reader :name, :plays
    def initialize(name)
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

    # def tiles
    #   bag = Scrabble::TileBag.new
    #   players_tiles = bag.draw_tiles(7)
    #   x = rand(0..7)
    #   x.times do
    #   players_tiles -= players_tiles.last
    #   return players_tiles
    #   #Scrabble::TileBag.draw_tiles(num)
    # end

    #  Returns a collection of letters that the player can play:
    def tiles
      @tiles
    end

    # Next method fills tiles array until it has 7 letters from the given tile bag

    # I think, for this task, we don't need to provide logic that removes
    #tiles from @tiles array that player played (I tried to do this , but to
    # do this I needed to add many lines of additional code and methods),
    # and task requirements doesn't say that we need to do this.

    # We only need to fill this array if it has less than 7 tiles in it:
    def draw_tiles(tile_bag)
      if tiles.length < 7
        @tiles += tile_bag.draw_tiles(7 - tiles.length)
      end
      puts @tiles
    end

  end # end of class
end # end of module

bag = Scrabble::TileBag.new
player = Scrabble::Player.new("Natalia")
