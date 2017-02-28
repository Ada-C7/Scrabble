require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring.rb'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Scoring" do

  # score = Scrabble::Scoring.new
  # score.must_be_instance_of Scrabble::Scoring

  describe "Scoring#initialize" do
    it "initializes" do
      score = Scrabble::Scoring.new
      score.must_be_instance_of Scrabble::Scoring
    end

    it "returns a letter_scores hash" do
      score = Scrabble::Scoring.new
      score.letter_scores.must_be_kind_of Hash
    end

    it "will throw error if given an arguments" do
      proc {
        Scrabble::Scoring.new("hello")
      }.must_raise ArgumentError
    end

    it "returns a hash of length 26" do
      score = Scrabble::Scoring.new
      score.letter_scores.length.must_equal 26
    end

  end

end
