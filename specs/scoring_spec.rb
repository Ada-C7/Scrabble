require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring'
Minitest::Reporters.use!


describe "Scoring class" do
  it "Creates new instance of Scoring class" do
      Scrabble::Scoring.new.class.must_equal Scrabble::Scoring
  end

  it "Values and letters are stored in a hash" do
    Scrabble::Scoring::LETTERS_VALUES.class.must_equal Hash
  end





end
