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

    it "returns false if the player has already won" do
      @player.play("zzzzzx")
      @player.play("zzzzzj")
      @player.play("lol").must_equal false
    end

    it "returns true if player has over 100 points" do
      @player.play("zzzzzx")
      @player.play("zzzzzj")
      @player.won?.must_equal true
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

  describe "Scrabble::Player#highest_scoring_word and #highest_word_score" do
    
    before do
        @player = Scrabble::Player.new("Ada")
        @player.play("cat")
        @player.play("zzzzz")
        @player.play("horse")
        @player.play("noon")
    end

    it "returns correct highest scoring word" do
    @player.highest_scoring_word.must_equal "zzzzz"
    end

    it "returns correct score of highest scoring word" do
    @player.highest_word_score.must_equal 50
    end

  end

end
