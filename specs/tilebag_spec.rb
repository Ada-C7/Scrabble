require_relative 'spec_helper'
require_relative '../lib/tilebag'

describe Scrabble::TileBag do
  before do
    @tile = Scrabble::TileBag.new
  end

  describe "#initialize" do
    before do
      @expected_tiles = [
        "A", "A", "A", "A", "A", "A", "A", "A",
        "A", "B", "B", "C", "C", "D", "D", "D",
        "D", "E", "E", "E", "E", "E", "E", "E",
        "E", "E", "E", "E", "E", "F", "F", "G",
        "G", "G", "H", "H", "I", "I", "I", "I",
        "I", "I", "I", "I", "I", "J", "K", "L",
        "L", "L", "L", "M", "M", "N", "N", "N",
        "N", "N", "N", "O", "O", "O", "O", "O",
        "O", "O", "O", "P", "P", "Q", "R", "R",
        "R", "R", "R", "R", "S", "S", "S", "S",
        "T", "T", "T", "T", "T", "T", "U", "U",
        "U", "U", "V", "V", "W", "W", "X", "Y",
        "Y", "Z"
      ]
    end
    it "Should set up the instance with a collection of all default tiles" do
      @tile.available_letters.sort.must_equal @expected_tiles
    end

    it "Initializes the tile bag in a shuffled order" do
      @tile.available_letters.wont_equal @expected_tiles
    end
  end

  describe "#draw_tiles" do
    it "Removes the tiles from the default set" do
      @tile.draw_tiles(3)
      expected_length = 98 - 3

      @tile.available_letters.length.must_equal expected_length
    end

    it "Raises an argument error if a letter is entered as the parameter" do
      proc {
        @tile.draw_tiles("A")
      }.must_raise ArgumentError
    end

    it "Raises an argument error if nil is entered as the parameter" do
      proc {
        @tile.draw_tiles(nil)
      }.must_raise ArgumentError
    end
  end

  describe "#tiles_remaining" do
    it "returns the number of tiles remaining in the bag" do
      @tile.draw_tiles(4)
      expected_length = 98 - 4

      @tile.tiles_remaining.must_equal expected_length
    end
  end
end
