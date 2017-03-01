require "scoring"

module Scrabble
  class Player < Scoring
    attr_reader :name, :plays
    def initialize(name)
      raise ArgumentError.new("Argument must be a string, the name of the player") if name.class != String
      @name = name
      @plays = []

    end

    def play(word)
      if won?
        return false
      else
        @plays << word
        return Scoring.score(word)
      end
    end

    def total_score
      @plays.map { |word| Scoring.score(word)}.sum
    end

    def won?
      total_score > 100 ? true : false
    end

    def highest_scoring_word
      Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      Scoring.score(highest_scoring_word)
    end


  end # End of class Player
end # End of module Scrabble
