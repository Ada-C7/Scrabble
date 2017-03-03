require 'simplecov'
SimpleCov.start
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
        score = Scrabble::Scoring.score("hat")
        score.must_equal 6
    end

    it "applies the bonus if there are 7 letters" do
      total_score = Scrabble::Scoring.score("scoring")
      total_score.must_be :>, 50
    end

    it "provides the total score including bonus if there are 7 letters" do
      total_score = Scrabble::Scoring.score("scoring")
      total_score.must_equal 60
    end
  end

  describe "self.highest_score_from(array)" do
    it "returns the word in the array with the highest score" do
      word_array = %w(coconut xylophone hello generosity)
      Scrabble::Scoring.highest_score_from(word_array).must_equal "coconut"
    end

    it "if tied, prefers the word with the fewest letters" do
      word_array = %w(helloa helm)
      Scrabble::Scoring.highest_score_from(word_array).must_equal "helm"
    end

    it "if multiple words, chooses the one with 7 letters with bonus" do
      word_array = %w(xylophone qqqqqq scoring generosity)
      Scrabble::Scoring.highest_score_from(word_array).must_equal "scoring"
    end

    it "if multiple words of same score and length, choose first one in supplied list" do
      word_array = %w(xylophone coconut scoding generosity)
      Scrabble::Scoring.highest_score_from(word_array).must_equal "coconut"
    end
  end
end
