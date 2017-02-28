require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scrabble'

Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

describe "Scrabble Scoring" do

  describe "self.highest_score_from method tests" do

    it "Method can be called without an error" do
      Scrabble::Scoring.must_respond_to :highest_score_from
    end

    it "Array passed must be an array of strings" do
      proc {
        Scrabble::Scoring.highest_score_from("hello")
      }.must_raise ArgumentError

      proc {
        Scrabble::Scoring.highest_score_from([890, "friend"])
      }.must_raise ArgumentError
    end

    it "Returns the highest scoring word" do
      #cat is 5, friend is 10
      Scrabble::Scoring.highest_score_from(["cat", "friend"]).must_equal "friend"
      #cat is 5, hi is 5
      Scrabble::Scoring.highest_score_from(["cat", "hi"]).must_equal "hi"
      #qqqqqq is 60, hiiiiii is 60
      Scrabble::Scoring.highest_score_from(["qqqqqq", "hiiiiii"]).must_equal "hiiiiii"

      Scrabble::Scoring.highest_score_from(["rat", "run", "sun", "tie"]).must_equal "rat"

    end

  end
  xdescribe "self.highest_score_from method tests" do
    it "Method can be called without an error" do
      Scrabble::Scoring.must_respond_to :highest_score_from
    end

    it "Array passed must be an array of strings" do
      proc {
        Scrabble::Scoring.highest_score_from("hello")
      }.must_raise ArgumentError

      proc {
        Scrabble::Scoring.highest_score_from([890, "friend"])
      }.must_raise ArgumentError
    end

    it "Returns the highest scoring word" do
      #cat is 5, friend is 10
      Scrabble::Scoring.highest_score_from(["cat", "friend"]).must_equal "friend"
      #cat is 5, hi is 5
      Scrabble::Scoring.highest_score_from(["cat", "hi"]).must_equal "hi"
      #qqqqqq is 60, hiiiiii is 60
      Scrabble::Scoring.highest_score_from(["qqqqqq", "hiiiiii"]).must_equal "hiiiiii"


    end

  end

end
