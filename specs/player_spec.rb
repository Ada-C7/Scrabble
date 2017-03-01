require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/player'
Minitest::Reporters.use!


describe "Player class" do
  describe "Player#initialize" do
    it "Creates an instance of Player class" do
      Scrabble::Player.new("Natalia").class.must_equal Scrabble::Player
    end

    it "Takes name as parameter" do
      player = Scrabble::Player.new("Natalia")
      player.must_respond_to :name
    end
    it "Creates an empty array to store player's words" do
      player = Scrabble::Player.new("Natalia")
      player.plays.class.must_equal Array
      player.plays.must_be_empty
    end
  end




end # end of class
