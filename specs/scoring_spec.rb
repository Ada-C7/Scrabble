require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring'

#Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Scrabble::Scoring" do
  it "Creates a new instance of Scoring class" do
    new_score = Scrabble::Scoring.new
    new_score.must_be_instance_of Scrabble::Scoring
  end

  it "score_chart is a hash " do
    Scrabble::Scoring::SCORE_CHART.must_be_instance_of Hash
  end

  it "score_chart associates each letter with it's Scrabble point value" do
    Scrabble::Scoring::SCORE_CHART["e"].must_equal 1
  end

  it "score method retruns an integer" do
    Scrabble::Scoring.score("word").must_be_instance_of Integer
  end

  it "score method raises argument error if input is not a string of lettersr" do
    proc {
      Scrabble::Scoring.score("5")
    }.must_raise ArgumentError
  end

end
