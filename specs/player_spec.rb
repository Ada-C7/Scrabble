require_relative 'spec_helper'

describe "Scrabble::Player" do

  before do
    @player = Scrabble::Player.new("Ada")
  end

  describe "Scrabble::Player#initalize" do

    it "can be initialized with a name" do
      @player.must_be_instance_of Scrabble::Player
    end

    it "raises argument error if invalid name" do
      proc {
        Scrabble::Player.new(7)}.must_raise ArgumentError
    end

    it "will return name by calling .name" do
      @player.name.must_equal "Ada"
    end

    it "will return an array of played words by calling .plays" do
      @player.play("kitty")
      @player.plays.must_be_kind_of Array
    end

    it "total score starts at 0" do
      @player.total_score.must_equal 0
    end
  end

    describe "Scrabble::Player#won?" do

      it "returns false if the player has not played any words" do
        @player.won?.must_equal false
      end

      it "returns false if the player has already won" do
        @player.play("zzzzzx")
        @player.play("zzzzzj")
        @player.play("lol").must_equal false
      end

      it "returns true if player has over 100 points" do
        @player.play("zzzzzx")
        @player.play("zzzzzj")
        @player.won?.must_equal true
      end
    end

    describe "Scrabble::Player#plays" do

      before do
        @player.play("cat")
      end

      it "Raises error if input is not a String" do
        proc {
          @player.play(88)}.must_raise ArgumentError
      end

      it "Raises error if input has a non-letter" do
        proc {
          @player.play("gorilla16")}.must_raise ArgumentError
      end

      it "Raises error if word is over 7 letters" do
        proc {
          @player.play("supercalifragilistic")}.must_raise ArgumentError
      end

      it "adds word to .plays array" do
        @player.plays.must_equal ["cat"]
      end

      it "adds multiple words to .plays array" do
        @player.play("dog")
        @player.play("Gator")
        @player.plays.must_equal ["cat", "dog", "Gator"]
      end

      it "adds multiple scores to total_score" do
        @player.play("dog")
        @player.play("gator")
        @player.total_score.must_equal 16
      end
    end

    describe "Scrabble::Player#highest_scoring_word and #highest_word_score" do

      before do
        @player.play("cat")
        @player.play("zzzzz")
        @player.play("horse")
        @player.play("noon")
      end

      it "returns correct highest scoring word" do
        @player.highest_scoring_word.must_equal "zzzzz"
      end

      it "returns correct score of highest scoring word" do
        @player.highest_word_score.must_equal 50
      end
    end

    it "Raises error if no words have been played" do
      proc {
        Scrabble::Player.new.plays}.must_raise ArgumentError
      proc {
        Scrabble::Player.new.highest_scoring_word}.must_raise ArgumentError
      proc {
        Scrabble::Player.new.highest_word_score}.must_raise ArgumentError
    end

    describe "Player#tiles and #draw_tiles" do

      before do
        @tile_bag = Scrabble::Tilebag.new
        @player = Scrabble::Player.new("Brenna")
        @player.draw_tiles(@tile_bag)
      end

      it "Fills tiles arrary until it has 7 letters from the tilebag" do
        @player.tiles.length.must_equal 7
      end

      it "Tiles array is filled with only letters" do
        @player.tiles.all? do | letter |
          letter.class.must_equal Symbol
          @tile_bag.letter_quantity.must_include letter
        end
      end
    end

  end
