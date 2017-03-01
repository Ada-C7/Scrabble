require_relative 'scrabble'

module Scrabble

  class Player
    attr_reader :name
    attr_accessor :plays, :score

    def initialize(name)
      raise ArgumentError.new "Player must have a valid name" if name.class != String
      @name = name
      @plays = []
      @score = 0
      @score_array = []

    def play(word)
      raise ArgumentError.new "Word must be a valid word" if word.class != String
      @plays << word
      return ((won?) ? false : Scoring.score(word))
    end

    def total_score
      raise ArgumentError.new "No words have been played" if @plays.length == 0
      score_array = @plays.map { |word| play(word) }
      return score_array.reduce(:+)
    end

    def won?
      raise ArgumentError.new "No words have been played" if @plays.length == 0
      return ((@score >= 100) ? true : false)
    end

    def highest_scoring_word
      return Scoring.highest_score_from_array(@plays)
    end

    def highest_word_score
      return Scoring.score(highest_scoring_word)
    end

  end



end
