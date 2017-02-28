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

    it "find score for a letter" do
      Scrabble::Scoring.score("W").must_equal 4
    end
  end

  describe "Scoring#highest_score_from" do

  end
  # Create a Scrabble module at the project root"

  # Create a Scrabble::Scoring class which contains some sort of
  # data structure to store the individual letter scores listed
  # below.

end
