require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/player.rb'

describe "Player" do
  describe "initalize" do
    it "can be instantiated" do
      player = Scrabble::Player.new("ada")
      player.must_be_instance_of Scrabble::Player
    end

    it "takes a name" do
      player = Scrabble::Player.new("ada")
      player.must_be_instance_of Scrabble::Player

      player.must_respond_to :name
      player.name.must_equal "ada"
    end

    it "creates an empty plays array" do
      player = Scrabble::Player.new("ada")

      player.must_respond_to :plays
      player.plays.must_be_instance_of Array
      player.plays.must_be_empty
    end

    it "raises an error if givne name is not a string" do
      proc {
        player = Scrabble::Player.new(24)
      }.must_raise ArgumentError
    end
  end

  describe "play" do
    it "returns score for the given word" do
      player = Scrabble::Player.new("Ada")
      played_word =  player.play("QUICKLY")
      played_word.must_be_instance_of Integer
      played_word.must_equal 75
    end

    it "updates the plays array" do
      player = Scrabble::Player.new("Ada")
      player.play("Ring")
      player.play("Hello")
      player.plays.must_include "Hello"
      player.play("Plane")
      player.plays.must_equal ["Ring", "Hello", "Plane"]
    end

    it "returns 'false' if player has over 100 points" do
      player = Scrabble::Player.new("Ada")
      player.play("QUICKLY")
      player.play("TORRENT")
      player.play("CAT").must_equal false
    end

    it "returns 'false' if player has 100 points"  do
      player = Scrabble::Player.new("Ada")
      player.play("QUICKLY")
      player.play("EXEQUY")
      player.play("CAT").must_equal false
    end
  end

  describe "total score" do
    it "returns sum of scores of played words" do
      player = Scrabble::Player.new("Ada")
      player.play("QUICKLY")
      player.play("TREE")
      player.play("CAT")
      sum_of_scores = player.total_score
      sum_of_scores.must_equal 84
    end
  end

  describe "won?" do
    it "returns 'true' if the player has > 100 points" do
      player = Scrabble::Player.new("Ada")
      player.play("QUICKLY")
      player.play("TORRENT")
      player.total_score.must_be :>, 100
      player.won?.must_equal true

    end

    it "returns 'true' if player has 100 points" do
      player = Scrabble::Player.new("Ada")
      player.play("QUICKLY")
      player.play("EXEQUY")
      player.total_score.must_equal 100
      player.won?.must_equal true
    end

    it "returns 'false' if player has < 100 points" do
      player = Scrabble::Player.new("Ada")
      player.play("TREE")
      player.play("CAT")
      player.total_score.must_be :<, 100
      player.won?.must_equal false
    end
  end

  describe "highest_scoring_word" do
    it "returns the highest scoring played word" do
      player = Scrabble::Player.new("Ada")
      player.play("TREE")
      player.play("TORRENT")
      player.highest_scoring_word.must_equal "TORRENT"
    end
  end

  describe "highest_word_score" do
    it "returns score of highest_scoring_word" do
      player = Scrabble::Player.new("Ada")
      player.play("TREE")
      player.play("TORRENT")
      player.highest_scoring_word.must_equal 57
    end
  end


end
