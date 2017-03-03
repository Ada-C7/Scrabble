module Scrabble

  class Player
    attr_reader :name, :plays

    def initialize(name)
      raise ArgumentError.new("Name input must be a String") if name.class != String
      @name = name
      @plays = []
    end

    def won?
      return total_score > 100 ? true : false
    end

    def play(word)
      raise ArgumentError.new("Word must be a string") if word.class != String
      if won?
        return false 
      else
        @plays << word
      end
      #eventually would check word against tiles,
      #to make sure player
      #only playes a word from tiles
      word_score = Scrabble::Scoring.score(word)
      return word_score
    end

    def total_score
      score = 0
      @plays.each do |word|
        score += Scrabble::Scoring.score(word)
      end
      score
    end

    def highest_scoring_word
      raise ArgumentError.new("Player has not played a word") if @plays.empty?
      return Scrabble::Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      raise ArgumentError.new("Player has not played a word") if @plays.empty?

      return Scrabble::Scoring.score(highest_scoring_word)
    end

    def tiles
      @tiles ||= Array.new
    end

    def draw_tiles(tile_bag)
      raise ArgumentError.new("You can only draw tiles from an object class TileBag.") if tile_bag.class != Scrabble::TileBag

      tiles.concat tile_bag.draw_tiles(7 - tiles.length)
    end
  end
end
