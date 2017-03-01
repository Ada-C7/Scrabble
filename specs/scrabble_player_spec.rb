gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scrabble_player'

describe "Scrabble::Player" do

  describe "initialize method" do

    before do
      @my_player = Scrabble::Player.new("you123***")
    end

    # it "must raise error if name parameter is not string" do
    #   proc { Scrabble::Player.new.(123)}.must_raise ArgumentError
    # end
    #
    # it "must raise error if name parameter is not all letters" do
    #   proc { Scrabble::Player.new("***")}.must_raise ArgumentError
    # end

    it "must be an instance of Player class" do
      @my_player.must_be_instance_of Scrabble::Player
    end

  end

  describe "plays method (changed to accessor call)" do

    before do
      @my_player = Scrabble::Player.new("you123***")
    end

    it "returns an array" do
      @my_player.Scrabble::Player.words_played.must_be_instance_of Array
    end

    it "returns an array of words played by the player" do
      @my_player.Scrabble::Player.play("abc")
      @my_player.Scrabble::Player.play("def")
      @my_player.Scrabble::Player.words_played.must_equal ["abc", "def"]
    end
  end

  describe "play(word) method" do

    it "does not allow player to play if points will go over 100 after play" do
      @winner = Scrabble::Player.new("winner")
      4.times do @winner.play("zzz")

        proc { @winner.play("zzz")}.must_raise ArgumentError
      end

      it "returns the score of the game" do
        @my_player.Scrabble::Player.play("aaa").must_equal 3

      end
    end

  end
end
