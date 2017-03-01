require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scrabble_scoring'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Scrabble Scoring" do
  it "creates a scrabble scoring class" do
    game = Scrabble::Scoring.new
    game.must_be_kind_of Scrabble::Scoring
  end

  it "the class contains a data structure" do
    game = Scrabble::Scoring.new
    game.letters.must_be_kind_of Hash
  end

  it "the method self.score(word) should return total score" do
    Scrabble::Scoring.score("yay").must_equal 9
  end
end


describe "highest_score_from" do
  it "retuns the highest scored word from an array" do
    word_arry = ["white", "yellow", "red", "black", "orange", "skyblue", "purple"]
    Scrabble::Scoring.highest_score_from(word_arry).must_equal "skyblue"
  end
end
