require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scrabble'

describe "Wave 1" do

#do we need initialize?

  describe "Score method" do

    it "word input must be string" do
      # skip
      proc {
        Scrabble::Scoring.score(666)
      }.wont_be_kind_of Numeric
    end

    it "make sure word is case sensitive" do
      # skip
      proc {
        Scrabble::Scoring.score("apple".downcase)
      }.wont_equal "APPLE"
    end

    it "word should return correct score" do
      # skip
      test_1 = Scrabble::Scoring.score("apple")
      test_1.must_equal 9
    end
    it "seven letter word gets 50 bonus points" do
      # skip
      test_1 = Scrabble::Scoring.score("jazzing")
      test_1.must_equal 83
    end
  end

  describe "highest_score_from method" do
    it "return highest scoring word from array" do
      # skip
      word_array = ["apple", "pear", "laptops"]
      test_1 = Scrabble::Scoring.highest_score_from(word_array)
      test_1.must_equal "laptops"

    end
  end

  describe "tiebreaking rules" do
    it "recognize two words with same score" do
      # skip
      array_of_words = ["apple","almond", "cat"]
      test_1 = Scrabble::Scoring.highest_score_from(array_of_words)
      test_1.must_equal 2
    end
    it "if multiple words prefer word with less letters" do
      skip
    end
    it "if multiple words prefer word that uses all seven letters" do
      skip
    end

    it "if multiple words prefer word that was supplied first" do
      skip
    end

  end

end
