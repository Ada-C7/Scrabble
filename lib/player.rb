require_relative "./scoring.rb"

module Scrabble
  class Player
    attr_reader :name, :plays

    def initialize(name)
        @name = name
        @plays = []
    end

    def play(word)
        if word.class !=String
            raise ArgumentError.new("The argument must be a string.")
        end

        word.each_char do |c|
            if c !~ /[a-z]/
                raise ArgumentError.new("Argument must contain only letters")
            end
        end

        # check if player has won
        @plays << word
        return Scoring.score(word)
    end

    def total_score
      # total = @plays.reduce {|sum, word| sum + Scoring.score(word)}
      total = 0
      @plays.each do |word|
        total += Scoring.score(word)
      end

      return total
    end







  end
end
