module Scrabble

  class Player
    attr_reader :name, :total_score, :tiles

    def initialize(name)
      raise ArgumentError.new("You must enter a name with letters.") if name.class != String
      @name = name
      @plays = []
      @total_score = 0
      @tiles = []
    end

    def draw_tiles(tile_bag)
      num = 7 - @tiles.length
      @tiles += tile_bag.draw_tiles(num)
    end

    def plays
      raise ArgumentError.new("You haven't played any words yet!") if @plays.empty?
      @plays
    end

    def won?
      @total_score >= 100 ? true : false
    end

    def play(word)
      return false if won?

      score = Scrabble::Scoring.score(word)
      @total_score += score

      @plays << word

      return score
    end

    def highest_scoring_word
      Scrabble::Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      Scrabble::Scoring.score(highest_scoring_word)
    end

  end
end
