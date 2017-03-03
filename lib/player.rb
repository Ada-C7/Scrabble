require_relative '../lib/score'
require_relative '../lib/tilebag'

module Scrabble
  class Player
    attr_accessor:name, :plays, :tiles
    def initialize(name, plays=[], tile_instance = Scrabble::Tilebag.new)
      @name = name
      @plays = plays
      @total_score = 0
      @tiles = tile_instance.draw_tiles(7)
    end


    def play(word)
      word.split("").each do |letter|
        Scrabble::Scoring.check_input(letter.capitalize)
      end
      @plays << word

      word_score = Scrabble::Scoring.score(word)
      @total_score += word_score
      won? ?   false : (word_score)
    end

    def won?
      @total_score > 100
    end

    def highest_scoring_word
      Scrabble::Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      Scrabble::Scoring.score(highest_scoring_word)
    end

    def draw_tiles(tile_bag)
      to_draw = 7 - @tiles.length
      @tiles.concat(tile_bag.draw_tiles(to_draw))
    end
  end
end
