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
  it "self.score returns an integer" do
    # skip
    Scrabble::Scoring.score("apple").must_be_kind_of Integer
    Scrabble::Scoring.score("apple").must_equal 9
  end
end
