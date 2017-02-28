require 'rake/testtask'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
# require 'csv'
require_relative '../lib/scoring'

Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

describe "Wave 1" do
  describe "self.score(word)" do
    it "verifies that a numeric score is returned" do
      score = Scrabble::Scoring.score("potato")
      score.must_be_kind_of Integer
    end

    it "returns the total score of the given word" do

    end

    it "applies the bonus if there are 7 letters" do

    end

    it "provides the total score including bonus if there are 7 letters" do

    end
  end

  describe "self.highest_score_from(array)" do
    it "returns the word in the array with the highest score" do

    end

    it "if tied, prefers the word with the fewest letters" do

    end

    it "if multiple words, chooses the one with 7 letters with bonus" do

    end

    it "if multiple words of same score and length, choose one in supplied list" do

    end
  end
end
