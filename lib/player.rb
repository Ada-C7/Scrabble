module Scrabble
  class Player
    attr_reader :name, :played_words

    def initialize(name)
      @name = name
      @played_words = []
      @total_score = 0
    end

    def plays
      @played_words
    end

    def play(word)
      @played_words << word
      # @total_score > 100 ? false : self.score(word)
    end

    def total_score
    end
  end
end
