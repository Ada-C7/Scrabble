require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring.rb'

describe "Scoring is a class" do
  it "must be type of scoring" do
    scoring = Scrabble::Scoring.new
    scoring.must_be_instance_of Scoring
  end

  describe "self.score" do
    it "Scoring knows-about self.score" do
    end

    it "Returns the total score for a given word" do
    end

    it "Raise ArgumentError if input is not a string" do
    end

    it "Seven letter word adds 50 point score bonus" do
    end

    it "Raise ArgumentError if input > 7 letter" do
    end

    it "Raise ArgumentError if empy string" do
    end


  end

  describe "self.highest_score_from" do
    it "If argument given is not an array, raise ArgumentError" do
    end

    it "Raise ArgumentError if its an empty array being passed in" do
    end

    it "Raise ArgumentError if array contains anything but string" do
    end

    it "Scoring knows-about self.highest_score_from" do
    end

    it "Return should be a String" do
    end

    it "If tie for highest score, fewer letters wins" do
    end

    it "If tie includes a seven letter word then the seven letter word wins" do
    end

    it "If tie words are same length pick the first in max array" do
    end


  end


end
