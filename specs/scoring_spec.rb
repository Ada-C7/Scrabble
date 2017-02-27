require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative "../lib/scoring"

describe Scrabble::Scoring do
  describe "#score" do
    it "Calculates the score of one word" do
      Scrabble::Scoring.score("apple").must_equal 9
    end

    it "Calculates the score of word without case sensitivity" do
      Scrabble::Scoring.score("APPLE").must_equal 9
    end

    it "Raises error if input is not a string" do
      proc {
        Scrabble::Scoring.score(1)
      }.must_raise ArgumentError
    end

    it "Gives 50 bonus points for 7 letter words" do
      Scrabble::Scoring.score("chicken").must_equal 68
    end
  end

  describe "#highest_score_from" do
    it "Returns the word with the highest score" do
      words = ["chicken", "apple"]
      Scrabble::Scoring.highest_score_from(words).must_equal "chicken"
    end

    it "Returns word with fewer letters in a tie" do
      words = ["land", "dig", "so"]
      Scrabble::Scoring.highest_score_from(words).must_equal "dig"
    end

    it "Returns word with 7 characters in a tie" do
      words = ["pizzazz", "zzzzk", "pimp"]
      Scrabble::Scoring.highest_score_from(words).must_equal "pizzazz"
    end

    it "Returns first word in a score & letter tie" do
      words = ["pizzazz", "zzzzdga", "zzzzk"]
      Scrabble::Scoring.highest_score_from(words).must_equal "pizzazz"
    end

  end

end
