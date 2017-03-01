require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
require_relative '../lib/player.rb'

describe "class Player" do
  describe "initialize" do
    it "can return the value of name as instance variable" do
      player_1 = Scrabble::Player.new("Bob")
      player_1.name.must_equal "Bob"
    end

    it "can return an array of the words as instance variable" do

    end
  end

  describe "#play(word)" do
    it "Adds the input word to the #plays array" do

    end

    it "returns false if player has already won" do

    end

    it "returns the score of the word" do

    end
  end

  describe "#total_score" do
    it "returns the sum of scores of played words" do

    end
  end

  describe "#won?" do
    it "returns true if the player has over 100 points, otherwise returns false" do

    end
  end

  describe "#highest_scoring_word" do
    it "returns the highest scoring played word" do

    end
  end

  describe "#highest_word_score" do
    it "returns the #highest_scoring_word score" do
        #integer


    end
  end

end
