require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scrabble_scoring'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Player#initialize"
  it "Creates a scrabble scoring class" do
    game = Scrabble::Player.new
    game.must_be_kind_of Scrabble::Player
  end

  it "Raises an ArgumentError when it's not created with name" do
    proc {
      Scrabble::Player.new("")
    }.must_raise ArgumentError
  end

  it "Should return the name of the player" do
    player = Scrabble::Player.new("Mickey")
    player.name.must_equal "Mickey"
  end

  it "Should return an empty array" do
    player = Scrabble::Player.new("Mickey")
    player.plays.must_be_kind_of Array
  end
end
