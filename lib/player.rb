require_relative 'letter'
require_relative 'score'
require 'awesome_print'


module Scrabble
  class Player
    attr_reader :name, :plays, :winner

    def initialize(name)
      @name = name
      @plays = []
      @winner = ""
      @score = 0
    end

    def play(word)
      return false if won? true
      @plays << word
      # @score = total_score
      Scoring.score(word)
    end

    def total_score
      return 0 if @plays == []
      player_score = @plays.map {| word | Scoring.score(word)}
      player_score.inject { | sum, points | sum + points }
    end

    def won?
      total_score > 100 ? true : false
    end

    def highest_scoring_word
      @winner = Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      score(@winner)
    end

  end

end
ada = Scrabble::Player.new("Ada")

puts ada.name
puts ada.play("book")
