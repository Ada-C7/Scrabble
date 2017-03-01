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

  describe "Player#play(word)" do
    it " Returns integer value " do
      player = Scrabble::Player.new("Natalia")
      player.play("flower").class.must_equal Integer
    end
    it "Saves word in @plays array" do
      player = Scrabble::Player.new("Natalia")
      player.play("flower")
      player.plays.must_include "flower"
    end
    it "Return false if player won " do
      player = Scrabble::Player.new("Natalia")
      player.play("flower")
      player.play("quizzes")
      player.play("hello")
      player.play("computer").must_equal false

    end
  end




end # end of class
