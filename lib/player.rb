# require_relative './scoring'

module Scrabble
  class Player
    attr_reader :name, :plays

    @@total_score = 0

    def initialize(name)
      @name = name
      @plays = []
      @word_scores = []
    end

    def score(word)
      return Scoring.score(word)
    end

    def play(word)
      @plays << word
      if won?
        false
      else
        @word_scores << score(word)
      end
      @word_scores.last
    end

    def total_score
      @@total_score = @word_scores.reduce(:+)
    end

    def highest_scoring_word
      highest_scoring_word(@plays)
    end

    def highest_word_score
      @word_scores.max
    end

    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    private

    def won?
      if @@total_score >= 100
        true
      else
        false
      end
    end
  end
end

test = Scrabble::Player.new('Tamago')

puts test.play('word')
puts test.play('cow')
puts test.play('zizzle')
