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

    it "Raises argument error if name is something other than a string" do
      proc {Scrabble::Player.new(1234)}.must_raise ArgumentError
    end

    it "Raises argument error if name string is empty" do
      proc {Scrabble::Player.new("")}.must_raise ArgumentError
    end

    it "returns an empty Array of the words played by the player" do
      @player.must_respond_to :plays
      @player.plays.must_be_instance_of Array
      @player.plays.length.must_equal 0
    end

    it "returns an empty Array of tiles" do
      @player.must_respond_to :tiles
      @player.tiles.must_be_instance_of Array
      @player.tiles.length.must_equal 0
    end

  end

  describe "Player#play" do
    it "Adds the input word to the plays Array" do
      @player.play("camel")
      @player.play("soup")

      @player.plays.must_include "CAMEL"
      @player.plays.must_include "SOUP"
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

    it "doesn't allow words > 7 letters" do
      proc { @player.play("discombobulated") }.must_raise ArgumentError
    end

    it "doesn't allow blank words" do
      proc { @player.play("") }.must_raise ArgumentError
    end

    it "forces words to be only made up of letters" do
      proc { @player.play("he11o")}.must_raise ArgumentError
      proc { @player.play("I'm a word") }.must_raise ArgumentError
    end

    it "allows both uppercase/lowercase words" do
      @player.play("SETTING")
      @player.play("setting")

      @player.plays.length.must_equal 2
    end

    describe "Player#total_score" do
      it "Returns the sum of scores of played words" do
        @player.play("green")
        @player.play("hello")

        @player.total_score.must_equal Scrabble::Scoring.score("green") + Scrabble::Scoring.score("hello")
      end

      it "returns 0 if total_score is called when no words have been played" do
        @player.total_score.must_equal 0
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

      it "Returns false if player hasn't played any words" do
        @player.won?.must_equal false
      end
    end

    describe "Player highest score" do
      it "Returns the highest scoring played word" do
        @player.play("hello")
        @player.play("green")
        @player.play("bat")

        @player.highest_scoring_word.must_equal "HELLO"
      end

      it "Raises argument error if highest_scoring_word is called when no words have been played" do
        proc {@player.highest_scoring_word}.must_raise ArgumentError
      end

      it "Returns the highest word's score" do
        @player.play("hello")
        @player.play("green")
        @player.play("bat")

        @player.highest_word_score.must_equal Scrabble::Scoring.score("HELLO")
      end

      it "Raises argument error if highest_word_score is called when no words have been played" do
        proc {@player.highest_word_score}.must_raise ArgumentError
      end

    end
  end
end
