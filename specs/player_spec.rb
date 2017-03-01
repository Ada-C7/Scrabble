require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/player'

#Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Scrabble::Player" do

  it "Creates a new instance of Player class" do
    new_player = Scrabble::Player.new("Dan")
    new_player.must_be_instance_of Scrabble::Player
  end

  it "name returns the value of the @name instance variable." do
    new_player = Scrabble::Player.new("Dan")
    new_player.name.must_equal "Dan"
  end

  it "plays returns an array" do
    new_player = Scrabble::Player.new("Dan")
    new_player.plays.must_be_instance_of Array
  end

  it "play(word) adds word to @plays" do
    new_player = Scrabble::Player.new("Dan")
    new_player.play("word")
    new_player.plays.must_include "word"
  end

  it "plays returns an array of all words played" do
    new_player = Scrabble::Player.new("Dan")
    new_player.play("word")
    new_player.play("play")
    new_player.play("win")
    new_player.plays.must_equal ["word", "play", "win"]
  end

  it "play(word) returns false if player has already won" do
    new_player = Scrabble::Player.new("Dan")
    new_player.play("zoology")
    new_player.play("subject")
    new_player.play("game").must_equal false
  end

  it "player.won? returns true if player has over 100 points." do
    new_player = Scrabble::Player.new("Dan")
    new_player.play("zoology")
    new_player.play("subject")
    new_player.won?.must_equal true
  end

  it "player.won? returns false if player has <= 100 points." do
    new_player = Scrabble::Player.new("Dan")
    new_player.play("zoology")
    new_player.won?.must_equal false
  end


end
