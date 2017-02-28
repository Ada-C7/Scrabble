require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring'


describe "Wave 1" do
  describe "Scoring#initialize" do

  end

  describe "Scoring#score" do
    it "returns a number for the total score" do
      Scrabble::Scoring.score("W").class.must_equal Integer
    end

    it "find score for a letter not case sensitive" do
      Scrabble::Scoring.score("W").must_equal 4
      Scrabble::Scoring.score("w").must_equal 4
    end

    it "find score for a string" do
      Scrabble::Scoring.score("Hello").must_equal 8
    end

    it "if array is 7 letters, add 50" do
      Scrabble::Scoring.score("Rainbow").must_equal 62
    end
  end

  describe "Scoring#highest_score_from" do

  end
  # Create a Scrabble module at the project root"

  # Create a Scrabble::Scoring class which contains some sort of
  # data structure to store the individual letter scores listed
  # below.

end
