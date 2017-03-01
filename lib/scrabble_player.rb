require_relative './scrabble_scoring.rb'
module Scrabble
  class Player
    attr_reader :name
    attr_accessor :plays, :scores
    def initialize(name)
      @name = name
      @plays = []
      @scores = []
      raise ArgumentError.new("Name must be entered") if name == ""
    end

    def play(word)
      raise ArgumentError.new("Please enter a word") if word.class != String
      return false if won?
      @plays << word
      @scores << Scrabble::Scoring.score(word)
      return Scrabble::Scoring.score(word)
    end

    def total_score
      @scores.inject(:+)
    end


    def won?
      false
      # total_score > 100
    end


  end
end

# puts Scrabble::Player.new("test").class
