module Scrabble

  class Player
    attr_reader :name, :plays

    def initialize(name)
      @name = name
      @plays = []
      @total_score = 0
    end


    def play(word)
        return false if won?
        @plays << word
        Scrabble::Scoring.score(word)
    end


    def total_score
      scores_array = @plays.map {|word| Scrabble::Scoring.score(word)}
      @total_score = scores_array.sum
      return @total_score
    end


    def won?
      (total_score > 100) ? true : false
    end

  end
end
