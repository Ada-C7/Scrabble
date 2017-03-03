require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring'


describe "Wave 1" do

  describe "Scoring#score" do
    it "returns a number for the total score" do
      Scrabble::Scoring.score("W").class.must_equal Integer
    end

    it "find score for a letter not case sensitive" do
      Scrabble::Scoring.score("W").must_equal 4
      Scrabble::Scoring.score("w").must_equal 4
    end

    it "find score for a string" do
      Scrabble::Scoring.score("Hello").must_equal 8
    end

    it "if array is 7 letters, add 50" do
      Scrabble::Scoring.score("Rainbow").must_equal 62
    end
  end

  describe "Scoring#highest_score_from" do
    it "returns a string" do
      Scrabble::Scoring.highest_score_from(["x"]).class.must_equal String
    end

    it "calculate score for each string and return the string with highest score" do
      array_of_strings = %w(Hello Max)
      Scrabble::Scoring.highest_score_from(array_of_strings).must_equal "Max"
    end

    it "returns array with string length 7 or returns array of max_word_array" do
      array_of_strings = %w(zzzzzx risotdo hello)
      Scrabble::Scoring.highest_score_from(array_of_strings).must_equal "risotdo"
    end

    it "return the shortest word out of two word with same score" do
      array_of_strings = %w(hello wind to)
      Scrabble::Scoring.highest_score_from(array_of_strings).must_equal "wind"
    end

    it "return the first word out of two word with same score and length" do
      array_of_strings = %w(hello silly)
      Scrabble::Scoring.highest_score_from(array_of_strings).must_equal "hello"
    end
  end
end
