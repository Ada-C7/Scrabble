require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/player.rb'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Player" do

  before do
    @name = "Ada"
    @player = Scrabble::Player.new(@name)
  end

  describe "Player#initialize" do

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

    it "returns a number(the score)" do
      @player.play("hello").must_be_kind_of Integer
    end

    it "returns the appropriate score" do
      @player.play("hello").must_equal 8
      @player.play("algebra").must_equal 60
    end

    # might ahve to break this spec up
    it "adds the word to the plays array" do
      # @palyer.plays.length.must_equal 0
      @player.play("hello")
      @player.plays.length.must_equal 1
      @player.play("algebra")
      @player.plays.length.must_equal 2
      @player.plays.must_equal ["hello", "algebra"]
    end

    it "returns false if player has already won" do
      @player.total_score(100)
      @player.play("hello").must_equal false
    end
  end

  describe "Player#total_score" do

    it "Requires a parameter" do
      proc {
        @player.total_score
      }.must_raise ArgumentError
    end

    it "Returns a number" do
      @player.total_score(34).must_be_kind_of Integer
    end

    it "Returns the appropriate score" do
      @player.total_score(34)
      @player.total_score(4)
      @player.total_score(6).must_equal 44
    end

  end

  describe "Player#won?" do

    it "Returns true if player has 100 points or more" do
      @player.total_score(100)
      @player.won?.must_equal true
    end

    it "Returns false if player has less than 100 points" do
      @player.total_score(50)
      @player.won?.must_equal false
    end
  end

  describe "Player#highest_word_score" do

    # it "requires an argument" do
    #   proc{
    #     @player.highest_word_score()
    #   }.must_raise ArgumentError
    # end
    #
    # it "requires an array argument" do
    #   proc{
    #     @player.highest_word_score("hello")
    #   }.must_raise ArgumentError
    #
    #   proc{
    #     @player.highest_word_score(123)
    #   }.must_raise ArgumentError
    # end

    it "returns the higest scoring word of the array" do
      @player.play("hello")
      @player.play("cat")
      @player.play("algebra")
      @player.highest_word_score.must_equal "algebra"
    end
  end
end
