require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scrabble'

describe "Wave 1" do

#do we need initialize?

  describe "Score method" do
    it "total score for given word" do
      @test_1 = Scrabble::Scoring.score("apple")
      @test_1.must_equal 9
    end

    it "word input must be string" do
      # skip
      word = "apple"
      @test_1 = Scrabble::Scoring.score(word)
      @test_1.class.must_equal String #Proc test, raise arugment error
    end

    it "make sure word is case sensitive" do
      skip
    end

    it "word should return correct score" do
      skip
    end
  end

  describe "highest_score_from method" do
    it "test for empty array" do
      skip
    end
    it "return highest scoring word from array" do
      skip
    end
  end

  describe "tiebreaking rules" do
    it "recognize two words with same score" do
      skip
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
