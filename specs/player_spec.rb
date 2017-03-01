require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
require_relative '../lib/score'
require_relative '../lib/player'


describe "class Player" do
  describe "initialize" do
    it "can return the value of name as instance variable" do
      player_1 = Scrabble::Player.new("Bob")
      player_1.name.must_equal "Bob"
    end

    it "can return an array of the words as instance variable" do
      player_1 = Scrabble::Player.new("Bob")
      player_1.plays.must_be_kind_of Array
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
    it "returns true if the player has over 100 points" do
      player_1 = Scrabble::Player.new("Bob")
      player_1.won?(101).must_equal true
    end

    it "returns false if the player has less than 100 points" do
      player_1 = Scrabble::Player.new("Bob")
      player_1.won?(99).must_equal false
      player_1.won?(100).must_equal false
    end
  end

  describe "#highest_scoring_word" do
    it "returns the highest scoring played word" do
      player_1 = Scrabble::Player.new("Bob",["ok","dog"])
      player_1.highest_scoring_word.must_be_kind_of String
    end

    it "returns the highest scoring played word" do
      player_1 = Scrabble::Player.new("Bob", ["ox", "rat"])
      player_1.highest_scoring_word.must_equal "ox"
    end

    it "returns the shortest word as the best word if there tie score" do
      Scrabble::Scoring.highest_score_from(["bat","rents"]).must_equal "bat"
    end

    it "returns the first word as the best word if the two words with the same length tie" do
      Scrabble::Scoring.highest_score_from(["bat","cat"]).must_equal "bat"
    end
  end

  describe "#highest_word_score" do
    it "returns the #highest_scoring_word score" do
      player_1 = Scrabble::Player.new("Bob",["Cat",
        "Dog"])
        player_1.highest_word_score.must_be_kind_of Integer
      end
      #
      # it "returns the score for the word that has the highest score" do
      #   player_1 = Scrabble::Player.new("Bob", ["ox", "rat"])
      #   player_1.highest_word_score.must_equal 9

      #end
    end
  end
