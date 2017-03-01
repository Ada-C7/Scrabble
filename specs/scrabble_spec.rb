require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scrabble'

Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

describe "Scrabble Scoring" do

  describe "Self.score method tests" do

    it "Method can be called without an error" do
      Scrabble::Scoring.must_respond_to :score
    end

    it "Raises an error when the word parameter is invalid data type" do
      proc{
        Scrabble::Scoring.score("sammy3")
      }.must_raise ArgumentError

      proc{
        Scrabble::Scoring.score([1,2,3])
      }.must_raise ArgumentError

      proc{
        Scrabble::Scoring.score("Monalisa")
      }.must_raise ArgumentError
    end

    it "Returns the word score as a positive integer value" do
      Scrabble::Scoring.score("").class.must_equal Integer
      Scrabble::Scoring.score("").must_be :>=, 0
      Scrabble::Scoring.score("").must_equal 0
      Scrabble::Scoring.score("hat").must_equal 6
    end

    it "Addes additional 50 points to the word passed if it's 7 letters" do
      Scrabble::Scoring.score("bananas").must_equal 59
    end

  end

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

      proc {
        Scrabble::Scoring.highest_score_from([])
      }.must_raise ArgumentError

    end

    it "Only one highest score case, returns word with max score" do
      Scrabble::Scoring.highest_score_from(["cat", "friend"]).must_equal "friend"
    end

    it "Tied highest score case, returns first 7 letter word" do
      Scrabble::Scoring.highest_score_from(["qqqqqq", "hiiiiii"]).must_equal "hiiiiii"
      Scrabble::Scoring.highest_score_from(["qqqqqq", "hiiiiii", "fiiiiii"]).must_equal "hiiiiii"
    end

    it "Tied highest score case, returns first shortest word" do
      Scrabble::Scoring.highest_score_from(["cat", "hi"]).must_equal "hi"
      Scrabble::Scoring.highest_score_from(["cat", "dad" ,"pit"]).must_equal "cat"
    end
  end
end
