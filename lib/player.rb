module Scrabble
  class Player

    attr_reader :name, :plays, :total_score

    def initialize(name)
      raise ArgumentError.new "Name must be string" if name.class != String
      @plays = []
      @name = name
      @total_score = 0
    end


    def play(word)
      # adds the input word to the plays array
      if won?
        return false
      else
        @plays << word
        word_score = Scrabble::Scoring.score(word)
        @total_score += word_score
        return word_score
      end

    end

    def won?

      return @total_score > 100 ? true : false

    end

    def highest_scoring_word
      return Scrabble::Scoring.highest_score_from(@plays)
      # highest scoring played word will be returned
    end

    def highest_word_score
      Scrabble::Scoring.score(highest_scoring_word)
      # Score for highest scoring word will be returned
    end
  end
end
