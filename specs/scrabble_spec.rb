require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scrabble'

describe "Wave 1" do

#do we need initialize?

  describe "Score method" do
    it "total score for given word" do

    end
    it "word input must be string" do

    end
    it "make sure word is case sensitive" do

    end
    it "word should return correct score" do

    end
  end

  describe "highest_score_from method" do
    it "test for empty array" do

    end
    it "return highest scoring word from array" do

    end
  end

  describe "tiebreaking rules" do
    it "recognize two words with same score" do

    end
    it "if multiple words prefer word with less letters" do

    end
    it "if multiple words prefer word that uses all seven letters" do

    end

    it "if multiple words prefer word that was supplied first" do

    end

  end

end
