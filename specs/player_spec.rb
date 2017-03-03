require_relative 'spec_helper'
require_relative '../lib/player'

describe 'Player' do
  before do
    @body_words = %w(hip thorax clavicle philtrum)
    @bird_words = %w(owl chicken duck emu)
    @ada = Scrabble::Player.new("Ada")
  end

  describe "name" do
    it "only accepts a string" do
      proc { Scrabble::Player.new([4, 5])}.must_raise ArgumentError
    end

    it "returns the name" do
      @ada.name.must_equal "Ada"
    end
  end

  describe "plays" do
    it "returns an Array of all words played" do
      @body_words.each do |word|
        @ada.play(word)
      end

      @ada.plays.must_be_instance_of Array
      @ada.plays.must_equal @body_words
    end
  end

  describe "play(word)" do
    it "adds input word to plays Array" do
      @ada.play("cat")
      @ada.plays.must_be_instance_of Array
      @ada.plays.must_equal ["cat"]

      @ada.play("tiger")
      @ada.plays.length.must_equal 2
    end

    it "returns false if  player has already won" do
      @bird_words.each do |word|
        @ada.play(word)
      end
      @ada.play("kiwi")

      @ada.play("egg").must_equal false
    end

    it "returns the score of the word" do
      @ada.play("philtrum").must_equal 15
    end
  end

  describe "tiles" do

    it "must be an array" do
      @ada.tiles.must_be_instance_of Array
    end

    it "must be max 7 characters in length" do
      @ada.tiles.length.must_be :<=, 7
    end

    it "each element in the array is a one-char string" do
      @ada.tiles.each do |letter|
        letter.length == 1 && letter.length.class == String
      end
    end

  end

  describe "total_score" do
    it "returns the sum of scores of played words" do
      @bird_words.each do |word|
        @ada.play(word)
      end
      @ada.plays.length.must_equal 4
      @ada.total_score.must_equal 90
    end
  end

  describe "won?" do
    it "returns true if player has more than 100 points" do
      words = %w(owl chicken duck emu kiwi aaaaaad zzzzzj)
      words.each do |word|
        @ada.play(word)
      end
      @ada.won?.must_equal true
    end

    it "returns false if player has 100 points or fewer" do
      @bird_words.each do |word|
        @ada.play(word)
      end

      @ada.won?.must_equal false
    end
  end

  describe "highest_scoring_word" do
    it "returns the highest scoring word" do
      @bird_words.each do |word|
        @ada.play(word)
      end
      @ada.play("kiwi")
      @ada.highest_scoring_word.must_equal "chicken"
    end
  end

  describe "highest_word_score" do
    it "returns the highest_scoring_word score" do
      @bird_words.each do |word|
        @ada.play(word)
      end
      @ada.highest_word_score.must_equal 68
    end
  end

  describe "draw_tiles(tile_bag)" do
    before do
      @tile_bag = Scrabble::TileBag.new
    end

    it "argument must be instance of TileBag" do
      proc { @ada.draw_tiles([]) }.must_raise ArgumentError

      proc { @ada.draw_tiles("") }.must_raise ArgumentError

      proc { @ada.draw_tiles(nil) }.must_raise ArgumentError
    end

    it "returns Array of 7 tiles" do
      what_do_i_have = @ada.draw_tiles(@tile_bag)
      what_do_i_have.length.must_equal 7
    end

  end
end
