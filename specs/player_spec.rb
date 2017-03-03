require 'simplecov'
SimpleCov.start
require 'rake/testtask'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/player'

Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

describe "Wave 2" do
  describe "Player initializes with name" do
    it "returns the name of a player" do
      player = Scrabble::Player.new("Ada")
      player.name.must_equal "Ada"
    end
  end

  describe "Method Player#plays" do
    it "returns an array of strings" do
      player = Scrabble::Player.new("Ada")
      player.play("hello")
      player.play("helm")
      player.plays.must_be_kind_of Array
    end

    it "returns an array of played words" do
      player = Scrabble::Player.new("Ada")
      player.play("hello")
      player.play("helm")
      player.play("jello")
      player.plays.must_equal ["hello", "helm", "jello"]
    end
  end

  describe "Method Player#play(word)" do
    it "adds the played word to the play array" do
      player = Scrabble::Player.new("Ada")
      player.play("hello")
      player.play("helm")
      player.play("jello")
      player.plays.last.must_equal "jello"
    end

    it "returns false if the player has won" do
      player = Scrabble::Player.new("Ada")
      player.play("QUIZZIFY")
      player.play("GHERKINS")
      player.play("OXYPHENBUTAZONE")
      player.play("OXAZEPAM")
      player.total_score
      player.play("hello").must_equal false
    end

    it "returns the correct score of the played word" do
      player = Scrabble::Player.new("Ada")
      player.play("QUIZZIFY").must_equal 41
    end
  end

  describe "Method Player#total_score" do
    it "returns an integer" do
      player = Scrabble::Player.new("Ada")
      player.play("QUIZZIFY")
      player.play("GHERKINS")
      player.play("OXYPHENBUTAZONE")
      player.total_score.must_be_kind_of Integer
    end

    it "returns the sum of all scores of player's words" do
      player = Scrabble::Player.new("Ada")
      player.play("QUIZZIFY")
      player.play("GHERKINS")
      player.play("OXYPHENBUTAZONE")
      player.total_score.must_equal 98
    end

    it "returns instance of highest_scoring_word" do
      player = Scrabble::Player.new("Ada")
      player.play("hello")
      player.play("helm")
      player.play("OXYPHENBUTAZONE")
      player.best_word
      player.highest_scoring_word.must_equal "OXYPHENBUTAZONE"
    end

    it "returns the highest_scoring_word score" do
      player = Scrabble::Player.new("Ada")
      player.play("hello")
      player.play("helm")
      player.play("OXYPHENBUTAZONE")
      player.best_word
      player.max_score.must_equal 41
    end
  end

  describe "Method Player#won?" do
    it "returns true or false if the score is over 100 points" do
      player = Scrabble::Player.new("Ada")
      player.play("QUIZZIFY")
      player.play("GHERKINS")
      player.play("OXYPHENBUTAZONE")
      player.play("GENEROSITY")
      player.won?.must_equal true
    end
  end

  describe "Method Player#tiles" do
    it "players tiles are in an array?" do
      player = Scrabble::Player.new("Ada")
      player.tiles.must_be_kind_of Array
    end

    it "returns a total of 7 tiles" do
      player = Scrabble::Player.new("Ada")
      tiles = Scrabble::TileBag.new
      player.draw_tiles(tiles).length.must_equal 7
    end
  end
end
