require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'minitest/pride'
require_relative '../lib/scoring'

describe "Module Scrabble, Scoring Class" do
  it "exists" do
    skip

  end

  it "self.highest_word returns string"do
  self.highest_word.must_be_kind_of String
  end
end
