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
        Scoring.score(word)
      end
    end

      def total_score
        scores = @plays.map{ |word|Scoring.score(word) }
        return score.redude(:+)
      end
  end
end
