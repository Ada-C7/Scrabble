require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
require_relative '../lib/score.rb'


describe "class Scoring" do
  describe "#self.calculate_letter" do
    it "gives an error if a non-letter is entered" do
      proc{

        Scrabble::Scoring.calculate_letter(" ")
      }.must_raise ArgumentError
    end
  end
  it "returns the correct point score" do
    Scrabble::Scoring.calculate_letter("A").must_equal 1
    Scrabble::Scoring.calculate_letter("q").must_equal 10
  end


  describe "self.score" do
    it "raises an error if the word has a non-letter character" do
      proc{

        Scrabble::Scoring.score("black&white")
      }.must_raise ArgumentError
    end


    it "returns the right point value for word that is less than 8 letters" do
      Scrabble::Scoring.score("QuEens").must_equal 15
    end


    it "returns the right point value for word that is 8 letters" do
      Scrabble::Scoring.score("rainbows").must_equal 63
    end

    describe "break_ties" do

      it "returns the shortest word when the shortest word is first" do
        Scrabble::Scoring.break_ties(["cat","tepee"]).must_equal "cat"
      end

      it "returns the first word when the words are of equal length" do
        Scrabble::Scoring.break_ties(["cat","dog"]).must_equal "cat"
      end
    end


    describe "self.highest_score_from" do
      it "returns a single word if the array contains one word" do
        Scrabble::Scoring.highest_score_from(["bat"]).must_equal "bat"
      end
      #
      it "returns the highest scoring word when given two words" do
        Scrabble::Scoring.highest_score_from(["oxen","rat"]).must_equal "oxen"
      end

      it "returns the shortest word as the best word if there is more than one best word" do
        Scrabble::Scoring.highest_score_from(["bat","rents"]).must_equal "bat"
      end

      it "returns the first word as the best word if the two words with the same length" do
        Scrabble::Scoring.highest_score_from(["bat","cat"]).must_equal "bat"
      end
    end
  end
end
