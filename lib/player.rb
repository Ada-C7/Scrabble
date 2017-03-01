require_relative 'scoring'
module Scrabble
  class Player

    attr_reader :name, :plays
    def initialize(name)
      @name = name
      @plays = []
    end

    def play(word)
      return false if won?
      score = Scrabble::Scoring.score(word)
      @plays << word
      return score
    end

    def total_score
      total = 0
      @plays.each do |word|
        total += Scrabble::Scoring.score(word)
      end
      total
    end

    def won?
      return true if total_score >= 100
    end

    def highest_scoring_word
      Scrabble::Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      Scrabble::Scoring.score(highest_scoring_word)
    end


  end
end

player = Scrabble::Player.new("Natalia")
puts player.play("hello")
puts player.play("flower")
# puts player.play("table")
# puts player.play("hello")
puts player.highest_scoring_word
puts player.highest_word_score
puts
puts player.plays
