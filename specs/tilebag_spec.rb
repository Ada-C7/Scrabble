require_relative 'spec_helper'
require_relative '../lib/tilebag'

describe TileBag do

  before do
    @tile_bag = Scrabble::TileBag.new
    @all_tiles = ["e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "a", "i", "a", "i", "a", "i", "a", "i", "a", "i", "a", "i", "a", "i", "a", "i", "a", "i", "o", "o", "o", "o", "o", "o", "o", "o", "n", "r", "t", "n", "r", "t", "n", "r", "t", "n", "r", "t", "n", "r", "t", "n", "r", "t", "d", "l", "s", "u", "d", "l", "s", "u", "d", "l", "s", "u", "d", "l", "s", "u", "g", "g", "g", "b", "c", "f", "h", "m", "p", "v", "w", "y", "b", "c", "f", "h", "m", "p", "v", "w", "y", "j", "k", "q", "x", "z"]
  end

  describe "initialize" do

    it "creates an array of all 98 tiles" do
      @tile_bag.collection.length.must_equal 98
      @tile_bag.collection.must_be_instance_of Array
      @tile_bag.collection.must_equal @all_tiles
    end

    it "has the right number of each letter" do
      letter_a = @tile_bag.collection.select { |letter| letter == "a"}
      letter_a.length.must_equal 9

      test_letters = @collection.group_by { |letter| letter[0] }
      test_hash = test_letters.each { | k, v | letters[k] = v.length }

      letters = @tile_bag.collection.group_by { |letter| letter[0] }

      letter_hash = letters.each { |k, v| letters[k] = v.length }

      letter_hash.must_equal test_hash
    end


    describe "draw_tiles" do

      it "takes an Integer" do
        proc { @tile_bag.draw_tiles("cat")}.must_raise ArgumentError
      end

      it "returns an Array of same length as number of tiles drawn" do
        @tile_bag.draw_tiles(4).must_be_instance_of Array
        @tile_bag.draw_tiles(4).length.must_equal 4
      end

      it "returns an Array of one-character length strings" do
        draw = @tile_bag.draw_tiles(3)
        draw.
      end

    end

  describe "tiles_remaining" do
    it "returns the number of tiles remaining in the bag" do
      @tile_bag.tiles_remaining.must_equal 98

      @tile_bag.draw_tiles(3)
      @tile_bag.tiles_remaining.must_equal 95

      @tile_bag.draw_tiles(7)
      @tile_bag.tiles_remaining.must_equal 88
    end
  end

end
