require_relative '../lib/score'

module Scrabble
  class Player
    attr_reader :name, :plays
    def initialize(name, plays=[])
      @name = name
      @plays = plays
      @total_score = 0
    end

    def play(word)
      word.split("").each do |letter|
        Scrabble::Scoring.check_input(letter.capitalize)
      end
      @plays << word
      won?(@total_score) ? false : "not false"
      @total += Scrabble::Scoring.score(word)

    end

    def won?(score)
      score > 100
    end

    def highest_scoring_word
      Scrabble::Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      Scrabble::Scoring.score(highest_scoring_word)
    end


  end
end

# player1 = Scrabble::Player.new("Bob", ["ox", "rat"])
# p player1.highest_scoring_word
