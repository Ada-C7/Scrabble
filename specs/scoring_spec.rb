require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'minitest/pride'
require_relative '../lib/scoring'

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
