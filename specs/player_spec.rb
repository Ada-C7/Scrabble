require_relative 'spec_helper'
require_relative '../lib/player'

describe 'Player' do

  describe "name" do
    it "returns the name" do
      ada = Scrabble::Player.new("Ada")
      ada.name.must_equal "Ada"
    end
  end

  describe "plays" do
    it "returns an Array of the words played" do
      words_played = %w(hip thorax clavicle philtrum)
      @plays.must_be_instance_of Array
    end

  end

  describe "play(word)" do
    it "adds the input word to the plays Array" do
      al = Scrabble::Player.new("al")
      al.play("cat")
      al.plays.must_be_instance_of Array
      al.plays.must_equal ["cat"]
    end

    it "returns false if the player has already won" do
      al = Scrabble::Player.new("al")

    end

    it "returns the score of the word" do

    end
  end

  describe "total_score" do
    it "returns the sum of scores of played words" do
      words = %w(owl chicken duck emu kiwi aaaaaad zzzzzj)
      al = Scrabble::Player.new("al")
      words.each do |word|
        al.play(word)
      end

      al.total_score.must_equal 101
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
