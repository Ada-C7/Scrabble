require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'minitest/pride'
require_relative 'scoring'

describe "Module Scrabble, Scoring Class" do
  it "exists" do
    # skip
    Scrabble::Scoring.class.must_be_kind_of Class
  end
end

describe "self.score" do
  it "self.score returns an integer" do
    # skip
    Scrabble::Scoring.score("apple").must_be_kind_of Integer
    Scrabble::Scoring.score("apple").must_equal 9
  end

  it "self.score adds 50 points to 7 letter words" do
  Scrabble::Scoring.score("peaches").must_equal 64
  end
end

describe "self.highest_word" do
  it "self.highest_word returns string" do
    # skip
    Scrabble::Scoring.highest_word(["APPLE", "TEHUT", "ANNA"]).must_be_kind_of String
  end

  it "must throw ArgumentError if given non-text arguments" do

    proc {
      Scrabble::Scoring.highest_word(9)
    }.must_raise NoMethodError
  end

end

describe "testing helper method self.tiebreaker" do
  it "Breaks the loop to return the first 7 letter word" do
    Scrabble::Scoring.highest_word(%w(AAAAAAA IIIIIII NNNNNNN)).must_equal "AAAAAAA"
  end

end
