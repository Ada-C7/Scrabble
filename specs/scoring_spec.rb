require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring'

Minitest::Reporters.use!

describe "Wave 1" do
  it "Scrabble::Scoring.score returns total score" do
    word_score = Scrabble::Scoring.score("green")

    word_score.must_equal 6
  end

end
