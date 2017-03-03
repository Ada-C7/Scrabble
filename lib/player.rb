require_relative '../lib/score'
require_relative '../lib/tilebag'

module Scrabble
  class Player
    attr_accessor:name, :plays, :tiles
    def initialize(name, plays=[])
      @name = name
      @plays = plays
      @total_score = 0
      @tile_bag = Scrabble::Tilebag.new
      @tiles = @tile_bag.draw_tiles(7)
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

    def draw_tiles
      @tiles << @tile_bag.draw_tiles(15)
    end

  end

end


player1 = Scrabble::Player.new("Bob", ["ox", "rat"])
p player1.tiles
