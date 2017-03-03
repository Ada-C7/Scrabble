require_relative 'spec_helper'
require_relative '../lib/scoring.rb'

describe "Scoring is a class" do
  it "must be type of scoring" do
    scoring = Scrabble::Scoring.new
    scoring.must_be_instance_of Scrabble::Scoring
  end

  describe "initialize" do
  end

  describe "self.score" do

    it "Raise ArgumentError if input is not a string" do
      proc {
        Scrabble::Scoring.score(34)
      }.must_raise ArgumentError
    end

    it "Raise ArgumentError if word length > 7 or empty" do
      proc {
        Scrabble::Scoring.score("thoughtfull")
      }.must_raise ArgumentError

      proc {
        Scrabble::Scoring.score("")
      }.must_raise ArgumentError
    end

    it "Raise ArgumentError if input contains anything other than alpha characters" do
      proc {
        Scrabble::Scoring.score("wo2rd!")
      }.must_raise ArgumentError
    end

    it "Returns the total score for a given word" do
      test_word = "word"
      Scrabble::Scoring.score(test_word).must_equal 8
    end

    it "Seven letter word adds 50 point score bonus" do
      test_word = "shoebox"
      Scrabble::Scoring.score(test_word).must_equal 69
    end
  end

  describe "self.highest_score_from" do

    it "If argument given is not an array, raise ArgumentError" do
      # string
      proc {Scrabble::Scoring.highest_score_from("string")}.must_raise ArgumentError
      # integer
      proc {Scrabble::Scoring.highest_score_from(1)}.must_raise ArgumentError
      # nil
      proc {Scrabble::Scoring.highest_score_from(nil)}.must_raise ArgumentError
    end

    it "Raise ArgumentError if it's an empty array being passed in" do
      proc {Scrabble::Scoring.highest_score_from([])}.must_raise ArgumentError
    end

    it "Raise ArgumentError if array contains anything but string" do
      proc {Scrabble::Scoring.highest_score_from(["cat", 1, "blah"])}.must_raise ArgumentError
    end

    it "Return should be a String" do
      Scrabble::Scoring.highest_score_from(%w(cat dog piglet oink)).must_be_kind_of String
    end

    it "picks the 7-letter word in a tie" do
      Scrabble::Scoring.highest_score_from(%w(qqqqqj daaaaaa i)).must_equal "daaaaaa"
    end

    it "If tie for highest score, fewer letters wins" do
      Scrabble::Scoring.highest_score_from(%w(zzz dog kkkkkk oink)).must_equal "zzz"
    end

    it "If tie words are same length pick the first in max array" do
      Scrabble::Scoring.highest_score_from(%w(zzz dog qqq oink)).must_equal "zzz"
    end
  end
end
