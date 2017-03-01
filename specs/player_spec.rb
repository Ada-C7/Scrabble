require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/player'
require_relative '../lib/scoring'

Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

describe "Scrabble::Player" do

  describe "Scrabble::Player#initalize" do

    it "can be initialized with a name" do
      player = Scrabble::Player.new("Ada")
      player.must_be_instance_of Scrabble::Player
    end

    it "will return name by calling .name" do
      player = Scrabble::Player.new("Ada")
      player.name.must_equal "Ada"
    end

    it "will return an array of played words by calling .plays" do
      player = Scrabble::Player.new("Ada")
      player.plays.must_be_kind_of Array
    end

  end

  describe "Scrabble::Player#won?" do

    before do
      @player = Scrabble::Player.new("Ada")
    end

    it "Raises an argument error if the player has already won" do
      proc {@player.play("zzzzzx")
      @player.play("zzzzzj")}.must_equal false
    end

  end

  describe "Scrabble::Player#plays" do

    before do
      @player = Scrabble::Player.new("Ada")
      @player.play("cat")
    end

    it "adds word to .plays array" do
      @player.plays.must_equal ["cat"]
    end

    it "adds multiple words to .plays array" do
      @player.play("dog")
      @player.play("Gator")
      @player.plays.must_equal ["cat", "dog", "Gator"]
    end

    it "raises argument error if invalid word is played" do
      proc {@player.play("alligator")}.must_raise ArgumentError
    end

    it "adds multiple scores to total_score" do
      @player.play("dog")
      @player.play("gator")
      @player.total_score.must_equal 16
    end

  end

end
