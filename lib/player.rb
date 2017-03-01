module Scrabble
  class Player

    attr_reader :name, :plays

    def initialize(name)
      raise ArgumentError.new "Name must be string" if name.class != String
      @plays = []
      @name = name
    end


    def play(word)
      # adds the input word to the plays array
      # @plays << input_word
      # false - if player won
      # returns score of the word
    end

    def total_score
      #sum of scores of played words
    end

    def won?
      # true if total score is more than 100
    end

    def highest_scoring_word
      # highest scoring played word will be returned
    end

    def highest_word_score
      # Score for highest scoring word will be returned
    end
  end
end
