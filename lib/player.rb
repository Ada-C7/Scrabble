require_relative 'scoring'

module Scrabble
  class Player
    attr_reader :name, :plays, :won?
    def initialize(name)
      @name = name
      @plays = [""]
      # should won? instead be a method? will this instance variable work?
    end

    def won?
      return false unless total_score > 100
    end

    def play(word)
      return false if @won?
      # raise ArgumentError.new "This requires a string" if word.class != string
      @plays << word
      return Scrabble::Scoring.score(word)
    end

    def total_score
      total = 0
      @plays.each { |word| total += score(word) }
      # @won? = true if total > 100
      return total
    end

    def highest_scoring_word
      return Scrabble::Scoring.highest_word(@plays)
    end

    def highest_word_score
      return Scrabble::Scoring.score(highest_scoring_word)
    end

  end
end

ginny = Scrabble::Player.new
puts ginny.play("apple")
puts ginny.total_score
