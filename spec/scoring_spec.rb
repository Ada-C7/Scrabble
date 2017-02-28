require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring.rb'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Scoring" do

  describe "Scoring#score" do

    it "initializes" do
      Scrabble::Scoring.must_respond_to :score
    end

    it "Raises ArgumentError if no parameter given" do
      proc {
        Scrabble::Scoring.score
      }.must_raise ArgumentError
    end

    it "Raises an ArgumentError if not string" do
      word = 34355
      proc {
        Scrabble::Scoring.score(word)
      }.must_raise ArgumentError
    end

    it "returns a number" do
      Scrabble::Scoring.score("cat").must_be_kind_of Integer
    end

    it "returns the appropriate score" do
      Scrabble::Scoring.score("cat").must_equal 5
      Scrabble::Scoring.score("hello").must_equal 8
    end

    it "adds 50 point bonus for 7 letter words" do
      Scrabble::Scoring.score("algebra").must_equal 60
    end

  end

  describe "Scoring#highest_score_from" do

    before do
      @words_array = ["cat", "hello", "algebra"]
      @tie_words = ["ox", "meow", "cat", "ax"]
      @tie_words2 = ["algebra", "qzqzqz"]
      # @seven_letter_words = ["abashes", "abettal", "absents", "battler", "beanies", "beavers", "calling"]
    end

      it "raises an argument error is not given an array" do
        proc {
          Scrabble::Scoring.highest_score_from("cat")
        }.must_raise ArgumentError
      end

      it "returns a string" do
        Scrabble::Scoring.highest_score_from(@words_array).must_be_kind_of String
      end

      it "returns the word with the higest score" do
        Scrabble::Scoring.highest_score_from(@words_array).must_equal "algebra"
      end

      it "in tie, returns the word with the fewest letters" do
        Scrabble::Scoring.highest_score_from(@tie_words).must_equal "ox"
      end

      it "in tie, returns 7 letter words before others" do
        Scrabble::Scoring.highest_score_from(@tie_words2).must_equal "algebra"
      end

      it "in a tie with same length, returns the first one" do
        Scrabble::Scoring.highest_score_from(@tie_words).must_equal "ox"
      end
  end
end
