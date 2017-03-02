require_relative 'spec_helper'
require_relative '../lib/player'

describe "Scrabble player" do
  describe "#initialize method" do
    before do
      @player = Scrabble::Player.new("Monalisa")
    end
    it "Validates and initializes the name instance variable" do
      @player.name.must_be_instance_of String
      @player.name.must_equal "Monalisa"
    end
    it "Validates and initializes the players instance variables" do
      @player.plays.must_be_instance_of Array
      @player.plays.must_equal []
    end
  end
  describe "#play method" do
    before do
      @player = Scrabble::Player.new("Monalisa")
    end
    # check  argument is string and letters using regex.
    it "Validates the argument" do
      proc{
        @player.play(12345)
      }.must_raise ArgumentError
      proc{
        @player.play("qwe12")
      }.must_raise ArgumentError
    end
    it "Calling on the play method as word to @plays" do
      @player.play("first")
      @player.plays.length.must_equal 1
      @player.play("second")
      @player.plays.length.must_equal 2
    end
    it "Returns the score of the word if player hasn't already won" do
      @player.play("hiiiiii").must_equal 60
    end
    it "Returns false if player has already won" do
      @player.play("hiiiiii").must_equal 60
      @player.play("hiiiiii").must_equal false
    end
  end
  describe "#total_score method" do
    it "Returns the sum of the scores of the played word" do
      @player = Scrabble::Player.new("Monalisa")
      @player.total_score.must_equal 0
      2.times do
        @player.play("hiiiiii")
      end
      @player.total_score.must_equal 120
    end
  end

  describe "#won method" do
    before do
      @player = Scrabble::Player.new("Monalisa")
    end
    it "Returns false when total score is less than equal to 100" do
      @player.play("fiiiiii")
      @player.won.must_equal false
    end
    it "Returns true when total score is greater than 100" do
      2.times do
        @player.play("hiiiiii")
      end
      @player.won.must_equal true
    end
  end

  describe "#highest_score_word and #highest_word_score method" do
    before do
      @player = Scrabble::Player.new("Monalisa")
      @player.play("bananas")
      @player.play("cat")
    end
    it "Returns the highest scoring played word" do
      @player.highest_score_word.must_equal "bananas"
    end
    it "Returns the highest_scoring_word score" do
      @player.highest_word_score.must_equal 59
    end
  end
end
