require_relative 'spec_helper'
require_relative '../lib/player'

describe "Scrabble player" do
  describe "#initialize method" do
    before do
      @player = Scrabble::Player.new("Monalisa")
    end
    it "Initialize method can be called without an error" do
      @player.must_respond_to :initialize
      @player.name.must_be_instance_of String
      @player.name.must_equal "Monalisa"
    end
    it "Validates and initializes the instance variables" do
      @player.name.must_be_instance_of String
      @player.name.must_equal "Monalisa"
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
      @player.play("hiiiiii").must_equal false
    end
  end
  describe ""
end
