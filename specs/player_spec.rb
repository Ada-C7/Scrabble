require_relative 'spec_helper'
require_relative '../lib/player'

describe Scrabble::Player do
  before do
    @ada = Scrabble::Player.new("Ada")
  end
  describe "#initialize" do
    it "Initializes with a player's name" do
      @ada.name.must_equal "Ada"
    end

    it "Does not initialize without player name" do
      proc {
        Scrabble::Player.new
      }.must_raise ArgumentError
    end
  end

  describe "#play" do
    it "Adds a played word to the plays" do
      @ada.play("pickle")
      @ada.play("walrus")
      @ada.plays.must_equal ["pickle", "walrus"]
    end

    it "Returns false if the player has won" do
      @ada.play("pizzazz")
      @ada.play("quiz")
      @ada.play("blanket").must_equal false
    end
  end

  describe "#total_score" do
    it "Returns the player's total score" do
      @ada.play("pizzazz") # 95 points
      @ada.play("quiz") # 22 points
      @ada.total_score.must_equal 117
    end

    it "Returns a score of 0 if no words have been played" do
      @ada.total_score.must_equal 0
    end

    describe "#won?" do
      it "Returns true if the player has over 100 point" do
        @ada.play("pizzazz")
        @ada.play("quiz")  # total_score = 127
        @ada.won?.must_equal true
      end
      it "Returns false if the player didn't play" do
        @ada.won?.must_equal false
      end


    end

    describe "#highest_scoring_word" do
      it "Returns the highest scoring played word" do
        @ada.play("pizzazz")
        @ada.play("quiz")  # total_score = 127
        @ada.highest_scoring_word.must_equal "pizzazz"
      end
    end

    describe "#highest_word_score" do
      it "Returns the score of the highest_scoring_word" do
        @ada.play("pizzazz")
        @ada.play("quiz")  # total_score = 127
        @ada.highest_word_score.must_equal 95
      end
    end

  end
end
