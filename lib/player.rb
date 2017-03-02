require_relative "scrabble"

module Scrabble
  class Player
    attr_reader :name, :plays

    def initialize(name)
      raise ArgumentError.new("Invalid argument for name") if name.class != String
      @name = name
      @plays = []
    end

    def play(word)
      raise ArgumentError.new("Invalid argument for word") if word.class != String
      raise ArgumentError.new("Invalid data type entered for word") if word !~ /^[a-zA-Z]{0,7}$/
      if won
        return false
      else
        @plays << word
        return Scoring.score(word)
      end
    end

    def total_score
      scores = @plays.map{ |word| Scoring.score(word) }
      return scores.reduce(0,:+)
    end

    def won
      return total_score > 100 ? true : false
    end

    def highest_score_word
      return Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      scores = @plays.map{ |word| Scoring.score(word) }
      return scores.max
    end
  end
end
