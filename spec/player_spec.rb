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

    it "Contains an array of the words played by the player" do
      @player.must_respond_to :plays
      @player.plays.must_be_kind_of Array
      @player.plays.must_equal []
    end

    
  end

end
