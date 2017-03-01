require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/player.rb'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Player" do

  describe "Player#initialize" do
    before do
      @name = "Ada"
      @player = Scrabble::Player.new(@name)
    end

    it "initializes" do
      @player.must_be_instance_of Scrabble::Player
    end

    it "Takes a name" do
      @player.must_respond_to :name
      @player.name.must_equal @name
    end

    it "Raises ArgumentError if no name is given" do
      proc {
        Scrabble::Player.new
      }.must_raise ArgumentError
    end

    it "Raises an ArgumentError if not string" do
      proc {
        Scrabble::Player.new(4587)
      }.must_raise ArgumentError
    end

    it "creates an empty array that will hold the players words" do
      @player.must_respond_to :plays
      @player.plays.must_be_kind_of Array
      @player.plays.must_equal []
    end
  end

  describe "Player#play" do

    before do
      @name = "Ada"
      @player = Scrabble::Player.new(@name)
    end

    it "returns a number(the score)" do
      @player.score("hello").must_be_kind_of Integer
    end

    it "returns the appropriate score" do
      @player.score("hello").must_equal 8
      @player.score("algebra").must_equal 60
    end

    # might ahve to break this spec up 
    it "adds the word to the plays array" do
      @palyer.plays.length.must_equal 0
      @player.score("hello")
      @player.plays.length.must_equal 1
      @player.score("algebra")
      @player.plays.length.must_equal 2
      @player.plays.must_equal ["hello", "algebra"]
    end

    it "returns false if player has already won" do
      skip
    end
  end
end
