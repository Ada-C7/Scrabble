require_relative 'spec_helper'
require_relative '../lib/tilebag'

describe "Scrabble tilebag" do
  before do
    @tilebag = Scrabble::Tilebag.new
  end
  describe "#initialize method" do
    it "Should have a colection of default tiles" do
      @tilebag.tiles_remaining.wont_be_empty
      @tilebag.tiles_remaining.length.must_equal 98
    end
  end
  describe "#draw_tiles method" do
    it "Should return a collection of random tiles" do
      @tilebag.draw_tiles(1).must_be_instance_of Array
      @tilebag.draw_tiles(3).length.must_equal 3
    end
    it "Should remove the tiles from the default set" do
      @tilebag.draw_tiles(3)
      @tilebag.tiles_remaining.must_equal 95
    end
  end
  describe "tiles_remaining method" do
    it "Returns the number of tiles remaining in the bag" do
      @tilebag.draw_tiles(7)
      @tilebag.tiles_remaining.must_equal 91

    end
  end
end
