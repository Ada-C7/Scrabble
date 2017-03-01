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
end
