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


end
