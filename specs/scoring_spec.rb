require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring'

Minitest::Reporters.use!

describe "Wave 1" do
  describe "Scoring#score" do
    it "Scrabble::Scoring.score returns total score" do
      word_score = Scrabble::Scoring.score("green")

      word_score.must_equal 6
    end

    it "seven letter word gets 50 points bonus" do
      word_score = Scrabble::Scoring.score("setting")

      word_score.must_equal 58
    end

    it "doesn't allow words > 7 letters" do
      proc { Scrabble::Scoring.score("discombobulated") }.must_raise ArgumentError
    end

    it "doesn't allow blank words" do
      proc { Scrabble::Scoring.score("") }.must_raise ArgumentError
    end
  end
end
