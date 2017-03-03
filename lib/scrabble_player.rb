require_relative '../lib/scrabble'
require_relative '../lib/scrabble_tilebag'


module Scrabble
  #
  # puts "Please enter your username (characters only): "
  # name = gets.chomp.to_s

  class Player
    attr_accessor :words_played, :score_tracker, :player_tiles, :tile_bag
    attr_reader :name

    def initialize(name)
      @name = name.to_s
      @words_played = [""]
      @score_tracker = [0]
      @player_tiles = []
    end

    def plays
      return @words_played
    end


    def won?
      if @score_tracker.inject { |sum, n| sum + n } > 100
        puts "you won!"
        return true
      else
        return false
      end
    end


    def play(word)

      if @score_tracker.inject { |sum, n| sum + n } > 100
        raise ArgumentError.new "Error. You cannot play anymore. Please restart game."
      else
        @score_tracker << Scrabble::Scoring.score(word)
        @words_played << word
        return Scrabble::Scoring.score(word)
      end
    end

    def highest_scoring_word
      @words_played[@score_tracker.each_with_index.max[1]]
    end


    def highest_word_score
      return @score_tracker.max
    end

    def tiles
      return @player_tiles
    end

    def draw_tiles(tile_bag)
      #need way to track change in the instance of the tilebag
      until @player_tiles.length == 7
        draw = tile_bag.draw_tiles(1).first
        @player_tiles << draw
      end
      return @player_tiles
    end
  end
end
