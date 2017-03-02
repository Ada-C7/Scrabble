require_relative 'scoring'
module Scrabble
  class Player

    attr_reader :name, :plays
    def initialize(name)
      @name = name
      @plays = []
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
      bag = Scrabble::TileBag.new
      players_tiles = bag.draw_tiles(7)
      x = rand(0..7)
      x.times do
      players_tiles -= players_tiles.last
      return players_tiles
      #Scrabble::TileBag.draw_tiles(num)

    end

    def draw_tiles(tile_bag)
      if tiles.length < 7
        tiles << tile_bag.draw_tiles(7-tiles.length)
      # if tiles.length < 7
      #   Scrabble::TileBag.draw_tiles(7 - tiles.length)
      end
    end


    end
  end
end
bag = Scrabble::TileBag
player = Scrabble::Player.new("Natalia")
player.tiles
puts player.play("hello")



player.draw_tiles(bag)
puts player.tiles
puts player.play("hello")
puts player.tiles
puts player.play("flower")
puts player.play("table")
puts player.play("hello")
