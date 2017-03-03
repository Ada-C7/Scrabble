require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/player'

describe "Player class" do

  describe "name method" do
    it "returns name" do
      player = Scrabble::Player.new("Ada")
      player.name.must_equal "Ada"
    end
  end

  describe "play(word) method" do
    it "adds input word to the plays array" do
      player = Scrabble::Player.new("Ada")
      player.play("test")
      player.plays.must_include "test"
    end

    it "returns false if player already won" do
      #copy of "if played has >100 points return true" test, changed true to false
      player = Scrabble::Player.new("Ada")
      player.play("bar")
      player.play("foo")
      player.play("qzqzqzq")
      player.play("dog").must_be_same_as false

      #WHY CAN YOU STILL PLAY? THEY WON ALREADY. GOSH
    end

    it "returns score of the word" do
      player = Scrabble::Player.new("Ada")
      player.play("test")

      player.score.must_equal 4
    end

    it "returns an array of the words played by the player" do
      #().must_be_kind_of Array
      #maybe for what goes in the brackets is something like this
      player = Scrabble::Player.new("Ada")
      player.play("bar")
      player.play("foo")
      player.play("qzqzqzq")
      # now should be able to call similar to name method
      player.plays.must_be_kind_of Array
    end

  end


  describe "total_score method" do
    it "returns sum of scores of played words" do
      player = Scrabble::Player.new("Ada")
      player.play("test")
      player.play("foo")
      player.play("bar")

      player.total_score.must_equal 15

    end
  end

  describe "won? method" do
    it "if played has >100 points return true" do
      player = Scrabble::Player.new("Ada")
      player.play("bar")
      player.play("foo")
      player.play("qzqzqzq")

      player.won?.must_be_same_as true
    end

    it "if played has <100 points return false" do
      player = Scrabble::Player.new("Ada")
      player.play("test")
      player.play("foo")
      player.play("bar")

      # player.total_score -- no longer needs to be called
      #modified code so .won? already calls .total_score
      player.won?.must_be_same_as false
    end
  end

  describe "highest_scoring_word method" do
    it "returns highest scoring word played" do
      player = Scrabble::Player.new("Ada")
      player.play("test")
      player.play("foo")
      player.play("bar")

      # player.total_score -- no longer needs to be called
      #modified code so .won? already calls .total_score
      player.highest_scoring_word.must_equal "foo"
    end
  end

  describe "highest_word_score method" do
    it "returns the highest_scoring_word score " do
      player = Scrabble::Player.new("Ada")
      player.play("test")
      player.play("foo")
      player.play("bar")

      # player.total_score -- no longer needs to be called
      #modified code so .won? already calls .total_score
      player.highest_word_score.must_equal 6
    end
  end

end
