require_relative './scrabble_scoring'
require_relative './scrabble_tilebag'

module Scrabble
  class Player
    attr_reader :name
    attr_accessor :plays, :scores, :won, :total_score
    def initialize(name)
      @name = name
      @plays = []
      @scores = []
      @won = false
      raise ArgumentError.new("Name must be entered") if name == ""
    end

    def play(word)
      raise ArgumentError.new("Please enter a word") if word.class != String
      return false if @won == true
      @plays << word
      @scores << Scrabble::Scoring.score(word)
      total_score
      won?
      return Scrabble::Scoring.score(word)
    end

    def total_score
      @scores.inject(:+)
    end

    def won?
      @won = true if total_score > 100
    end

    def highest_scoring_word
      Scrabble::Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      @scores.max
    end

    def tiles
      player_tilebag = Scrabble::TileBag.new
      return player_tilebag.picked_tiles
    end

    def draw_tiles(tile_bag)
    end
  end
end

# player = Scrabble::Player.new("Mickey")
# player.plays = %w[blue yellow black]
# puts player.highest_scoring_word
# puts player.tiles
