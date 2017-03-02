require_relative 'spec_helper'
require_relative '../lib/player'

describe 'Player' do
  before do
    @body_words = %w(hip thorax clavicle philtrum)
    @bird_words = %w(owl chicken duck emu kiwi)
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
    it "adds the input word to the plays Array" do
      @ada.play("cat")
      @ada.plays.must_be_instance_of Array
      @ada.plays.must_equal ["cat"]

      @ada.play("tiger")
      @ada.plays.length.must_equal 2
    end

    it "returns false if the player has already won" do
      @bird_words.each do |word|
        @ad.play(word)
      end
      @ada.play("egg").must_equal false

    end

    it "returns the score of the word" do
      al = Scrabble::Player.new("al")
      al.play("philtrum").must_equal 15
    end
  end

  describe "total_score" do
    it "returns the sum of scores of played words" do
      words = %w(owl chicken duck emu)
      al = Scrabble::Player.new("al")
      words.each do |word|
        al.play(word)
      end
      al.plays.length.must_equal 4
      al.total_score.must_equal 90
    end
  end

  describe "won?" do
    it "returns true if player has more than 100 points, otherwise returns false" do
      words = %w(owl chicken duck emu kiwi aaaaaad zzzzzj)
      al = Scrabble::Player.new("al")
      words.each do |word|
        al.play(word)
      end
      al.won?.must_equal true
    end

    it "returns false if player has 100 points or fewer" do
      words = %w(owl hat duck emu kiwi)
      al = Scrabble::Player.new("al")

      words.each do |word|
        al.play(word)
      end

      al.won?.must_equal false
    end

  end

  describe "highest_scoring_word" do
    it "returns the highest scoring word" do
      words = %w(owl chicken duck emu kiwi)
      al = Scrabble::Player.new("al")
      words.each do |word|
        al.play(word)
      end
      al.highest_scoring_word.must_equal "chicken"
    end
  end

  describe "highest_word_score" do
    it "returns the highest_scoring_word score" do
      words = %w(owl chicken duck emu kiwi)
      al = Scrabble::Player.new("al")
      words.each do |word|
        al.play(word)
      end
      al.highest_word_score.must_equal 68
    end
  end
end
