require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative "../lib/player"

describe Scrabble::Player do
  before do
    @alix = Scrabble::Player.new("Alix")
  end
  describe "#initialize" do
    it "Initializes with a player's name" do
      @alix.name.must_equal "Alix"
    end

    it "Does not initialize without player name" do
      proc {
        Scrabble::Player.new
      }.must_raise ArgumentError
    end
  end

  describe "#play" do
    it "Adds a played word to the plays" do
      @alix.play("pickle")
      @alix.play("walrus")
      @alix.plays.must_equal ["pickle", "walrus"]
    end

    it "Returns false if the player has won" do
      @alix.play("pizzazz")
      @alix.play("quiz")
      @alix.play("blanket").must_equal false
    end
  end

  describe "#total_score" do
    it "Returns the player's total score" do
      @alix.play("pizzazz") # 95 points
      @alix.play("quiz") # 22 points
      @alix.total_score.must_equal 117
    end

    it "Returns a score of 0 if no words have been played" do
      @alix.total_score.must_equal 0
    end

    describe "#won?" do
      it "Returns true if the player has over 100 point" do
        @alix.play("pizzazz")
        @alix.play("quiz")  # total_score = 127
        @alix.won?.must_equal true
      end
      it "Returns false if the player didn't play" do
        # @alix.play("pizzazz")
        # @alix.play("quiz")  # total_score = 127
        @alix.won?.must_equal false
      end


    end

    describe "#highest_scoring_word" do
      it "Returns the highest scoring played word" do
        @alix.play("pizzazz")
        @alix.play("quiz")  # total_score = 127
        @alix.highest_scoring_word.must_equal "pizzazz"
      end
    end

    describe "#highest_word_score" do
      it "Returns the score of the highest_scoring_word" do
        @alix.play("pizzazz")
        @alix.play("quiz")  # total_score = 127
        @alix.highest_word_score.must_equal 95
      end
    end

  end
end
