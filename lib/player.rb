module Scrabble

  class Player
    attr_reader :name, :plays, :tiles

    def initialize(name)
      @name = name
      @plays = []
      @tiles = []
    end


    def play(word)
        return false if won?
        @plays << word
        Scrabble::Scoring.score(word)
    end

    def total_score
      scores_array = @plays.map {|word| Scrabble::Scoring.score(word)}
      return scores_array.sum
    end

    def won?
      (total_score > 100) ? true : false
    end

    def highest_scoring_word
      Scrabble::Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      Scrabble::Scoring.score(highest_scoring_word)
    end

    def draw_tiles(tile_bag)
      @tiles += tile_bag.draw_tiles(7 - @tiles.length)
    end

  end
end
