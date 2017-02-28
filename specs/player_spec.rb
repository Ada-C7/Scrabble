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
  end
end
