require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/score'
require_relative '../lib/letter'


Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new


describe Scrabble::Player do

  before do
    @player = Scrabble::Player.new("Boo")
  end

  describe "Player#initialize" do
    it "takes a name" do
      name = "Boo"
      player = Scrabble::Player.new(name)

      player.must_respond_to :name
      player.name.must_equal id
    end

    it "is a kind of Player" do
      @player.must_be_kind_of Scrabble::Player
    end

    it "returns an array of played words" do
      played_words = ["book", "quiver", "pen"]
      3.times { |n| @player.play(n) }

      @player.plays.must_equal played_words
    end


  end

  describe "Player#play" do
    it "returns a string" do
    end

  end

  describe "Player#total_score" do
  end

  describe "Player#won?" do
  end

  describe "Player#highest_scoring_word" do
  end

  describe "Player#highest_word_score" do
  end

end
