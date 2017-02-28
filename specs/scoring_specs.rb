require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring.rb'

describe "Scoring is a class" do
  it "must be type of scoring" do
    scoring = Scrabble::Scoring.new
    scoring.must_be_instance_of Scrabble::Scoring
  end

  describe "initialize" do
  end

  describe "self.score" do
    before do
      @scoring = Scrabble::Scoring.new
    end

    it "Scoring knows-about self.score" do
      skip
      Scrabble::Scoring.must_respond_to Scrabble::Scoring.score
    end

    it "Returns the total score for a given word" do
      test_word = "word"
      # Scrabble::Scoring.new
      Scrabble::Scoring.score(test_word).must_equal 8

      # skip
    end

    it "Raise ArgumentError if input contains anything other than alpha characters" do
      # skip
      proc {
        Scrabble::Scoring.score("wo2rd!")
      }.must_raise ArgumentError
    end

    it "Raise ArgumentError if input is not a string" do
      #skip
      proc {
        Scrabble::Scoring.score(34)
      }.must_raise ArgumentError
    end

    it "Raise ArgumentError if word length > 7 or empty" do
      # skip
      proc {
        Scrabble::Scoring.score("thoughtfull")
      }.must_raise ArgumentError

      proc {
        Scrabble::Scoring.score("")
      }.must_raise ArgumentError

    end

    it "Seven letter word adds 50 point score bonus" do
      # skip
      test_word = "shoebox"
      Scrabble::Scoring.score(test_word).must_equal 69

    end
  end

  describe "self.highest_score_from" do

    it "If argument given is not an array, raise ArgumentError" do
      skip
    end

    it "Raise ArgumentError if its an empty array being passed in" do
      skip
    end

    it "Raise ArgumentError if array contains anything but string" do
      skip
    end

    it "Scoring knows-about self.highest_score_from" do
      skip
    end

    it "Return should be a String" do
      skip
    end

    it "If tie for highest score, fewer letters wins" do
      skip
    end

    it "If tie includes a seven letter word then the seven letter word wins" do
      skip
    end

    it "If tie words are same length pick the first in max array" do
      skip
    end


  end


end
