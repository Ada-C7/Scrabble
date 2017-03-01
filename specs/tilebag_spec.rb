require_relative 'spec_helper'
require_relative '../lib/tilebag'

describe Scrabble::TileBag do

  describe "#initialize" do
    before do
      @tile = Scrabble::TileBag.new
    end

    it "Should set up the instance with a collection of all default tiles" do
      a = [
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

      @tile.available_letters.sort.must_equal a

    end
  end

  describe "drw_tiles" do

    it "Returns a collection of random tiles. " do


    end

    it "Removes the tiles from the default set" do


    end

  end

  describe "#tiles_remaining" do

    it "returns the number of tiles remaining in the bag" do

    end

  end





end
