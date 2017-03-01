require_relative 'spec_helper'
require_relative '../lib/player'

describe "Wave 2" do
  before do
    @player = Scrabble::Player.new("Mary")
  end

  describe "Player#initialize" do

    it "Takes a name" do
      @player.must_respond_to :name
    end

    it "returns an Array of the words played by the player" do
      @player.must_respond_to :plays
      @player.plays.must_be_instance_of Array
    end

  end

  describe "Player#play" do
    it "Adds the input word to the plays Array" do
      @player.play("hello")
      @player.plays.must_include "HELLO"
    end

    it "returns score of the word played" do
      @player.play("hello").must_equal Scrabble::Scoring.score("hello")
    end

    it "returns false if player has won" do
      @player.play("qzqzqz")
      @player.play("qzqzq")
      @player.play("hi").must_equal false
    end

    it "doesn't add word to plays if player has won" do
      @player.play("qzqzqz")
      @player.play("qzqzq")
      @player.play("hi")

      @player.plays.length.must_equal 2
    end

    describe "Player#total_score" do
      it "Returns the sum of scores of played words" do
        @player.play("green")
        @player.play("hello")

        @player.total_score.must_equal Scrabble::Scoring.score("green") + Scrabble::Scoring.score("hello")
      end
    end

    describe "Player#won" do
      it "If player has more than 100, returns true" do
        @player.play("qzqzq")
        @player.play("qzqzqa")

        @player.won?.must_equal true
      end

      it "If player has less than 100, returns false" do
        @player.play("qzqzq")
        @player.play("asdf")

        @player.won?.must_equal false
      end

      it "If player has exactly 100, returns false" do
        @player.play("qzqzq")
        @player.play("qzqzq")

        @player.won?.must_equal false
      end
    end

    describe "Player#highest_scoring_word" do
      it "Returns the highest scoring played word" do
        @player.play("hello")
        @player.play("green")
        @player.play("bat")

        @player.highest_scoring_word.must_equal "HELLO"
      end

    end


  end
end
