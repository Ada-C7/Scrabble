require 'simplecov'
SimpleCov.start

gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scrabble_player'
require_relative '../lib/scrabble'

describe "Scrabble::Player" do

  before do
    @my_player = Scrabble::Player.new("you123***")
    @my_tile_bag = Scrabble::Tilebag.new

  end


  describe "initialize method" do

    it "must be an instance of Player class" do
      @my_player.must_be_instance_of Scrabble::Player
    end

  end

  describe "plays method (changed to accessor call)" do

    it "returns an array" do
      @my_player.plays.must_be_instance_of Array
    end

    it "returns an array of words played by the player" do
      @my_player.play("abc")
      @my_player.play("def")
      @my_player.plays.must_equal ["", "abc", "def"]
    end
  end

  describe "play(word) method" do

    it "does not allow player to play if points will go over 100 after play" do
      4.times do @my_player.play("zzz")
      end
      proc { @my_player.play("zzz")}.must_raise ArgumentError
    end

    it "returns the score of the word" do
      @my_player.play("aaa").must_equal 3
    end

  end

  describe "highest_scoring_word" do

    it "returns the highest scoring word" do
      2.times do @my_player.play("zzz")
      end
      2.times do @my_player.play("aaa")
      end

      @my_player.highest_scoring_word.must_equal "zzz"
    end
  end

  describe "highest_word_score" do

    it "returns the score of the highest scoring word" do
      2.times do @my_player.play("zzz")
      end
      2.times do @my_player.play("aaa")
      end

      @my_player.highest_word_score.must_equal 30
    end

  end

  describe "won?" do
    it "if player has 100 or more points. give notice that they won" do
      4.times do @my_player.play("zzz")
      end
      @my_player.won?.must_equal true


    end

  end

  describe "tiles" do

    it "returns an array" do
      @my_player.draw_tiles(@my_tile_bag).must_be_kind_of Array
    end

    it "contains up to 7 tiles" do
      @my_player.draw_tiles(@my_tile_bag)
      @my_player.tiles.length.must_equal 7
      print @my_player.tiles
    end
  end

end
