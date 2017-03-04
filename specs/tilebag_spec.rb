require_relative 'spec_helper'
require_relative '../lib/tilebag'

describe "Scrabble tilebag" do
  before do
    @tilebag = Scrabble::TileBag.new
  end

  describe "#initialize method" do
    it "Should have a colection of default tiles" do
      @tilebag.tiles.wont_be_empty
      @tilebag.tiles.length.must_equal 98
    end

    it "Should have appropriate number of tiles per each alphabet" do
      @tilebag.tiles.count("A").must_equal 9
      @tilebag.tiles.count("B").must_equal 2
      @tilebag.tiles.count("C").must_equal 2
      @tilebag.tiles.count("D").must_equal 4
      @tilebag.tiles.count("E").must_equal 12
      @tilebag.tiles.count("F").must_equal 2
      @tilebag.tiles.count("G").must_equal 3
      @tilebag.tiles.count("H").must_equal 2
      @tilebag.tiles.count("I").must_equal 9
      @tilebag.tiles.count("J").must_equal 1
      @tilebag.tiles.count("K").must_equal 1
      @tilebag.tiles.count("L").must_equal 4
      @tilebag.tiles.count("M").must_equal 2
      @tilebag.tiles.count("N").must_equal 6
      @tilebag.tiles.count("O").must_equal 8
      @tilebag.tiles.count("P").must_equal 2
      @tilebag.tiles.count("Q").must_equal 1
      @tilebag.tiles.count("R").must_equal 6
      @tilebag.tiles.count("S").must_equal 4
      @tilebag.tiles.count("T").must_equal 6
      @tilebag.tiles.count("U").must_equal 4
      @tilebag.tiles.count("V").must_equal 2
      @tilebag.tiles.count("W").must_equal 2
      @tilebag.tiles.count("X").must_equal 1
      @tilebag.tiles.count("Y").must_equal 2
      @tilebag.tiles.count("Z").must_equal 1
    end
  end

  describe "#draw_tiles method" do
    it "Should return a collection of random tiles" do
      @tilebag.draw_tiles(1).must_be_instance_of Array
      @tilebag.draw_tiles(0).length.must_equal 0
      @tilebag.draw_tiles(3).length.must_equal 3
    end

    it "Should remove the tiles from the default set" do
      @tilebag.draw_tiles(3)
      @tilebag.tiles.length.must_equal 95
    end
  end

  describe "tiles_remaining method" do
    it "Raises an error for invalid parameter data type" do
      proc {
        @tilebag.draw_tiles("three")
      }.must_raise ArgumentError
    end

    it "Returns the number of tiles remaining in the bag" do
      @tilebag.draw_tiles(7)
      @tilebag.tiles_remaining.must_equal 91
      @tilebag.tiles.length.must_equal 91
      @tilebag.draw_tiles(91)
      @tilebag.tiles_remaining.must_equal 0
      @tilebag.tiles.length.must_equal 0
    end
  end
end
