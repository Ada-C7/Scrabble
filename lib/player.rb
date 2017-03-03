require_relative 'scoring'
require_relative './tilebag/'
module Scrabble

  class Player
    attr_reader :name, :plays, :tile_bag, :total, :tiles

    def initialize(name, tile_bag)
      raise ArgumentError unless name.class == String
      @name = name
      @plays = []
      @total = 0
      @tile_bag = tile_bag
      @tiles = []
    end

    def play(word)
      test_word(word)
      word.downcase
      return false if won?
      @plays << word
      score = get_score(word)
      total_score(score)
      return score
    end

    # think of better name
    def test_word(word)
      if word.class != String
        raise ArgumentError.new "Input word must be a string"
      elsif  /\b[^\d\W]+\b/.match(word) == nil
        raise ArgumentError.new "Word can only include letters"
      end
    end

    # isolate the dependency on scoring class in its own method :)
    def get_score(word)
       Scrabble::Scoring.score(word)
    end

    def total_score(score)
      @total += score
    end

    def won?()
      @total >= 100 ? true : false
    end

    def highest_scoring_word
      highest_word = Scrabble::Scoring.highest_score_from(@plays)
      return highest_word
    end

    def highest_word_score
      highest_score = get_score(highest_scoring_word)
      return highest_score
    end

    # This method tiles is created by attr_reader, so we don't need to implement it here.
    # def tiles
    #   @tiles
    # end

    def draw_tiles(tile_bag)
      current_tiles = @tiles.length
      tiles_wanted = 7 - current_tiles
      @tiles += tile_bag.draw_tiles(tiles_wanted)
    end
  end
end

bag = Scrabble::TileBag.new
game = Scrabble::Player.new("Ada", bag)
# puts game.play("")
# puts game.play("hi")
# puts game.play("elephant")
# puts game.play("algebra")
# puts game.highest_scoring_word
puts game.draw_tiles(bag)
