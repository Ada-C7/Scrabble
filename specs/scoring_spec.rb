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

  it "score_chart is a hash which associates each letter with it's Scrabble value" do
    skip
    Scrabble::Scoring::SCORE_CHART.must_be_instance_of Hash#["e"].must_equal 1
  end

  # who's keys are the letters of alphabet
end
