require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
# require 'minitest/skip_dsl'
require 'minitest/pride'
require_relative '../lib/tile_bag'

describe "Test Tile_Bag creation" do
  it "instantiates and can be called" do
    # skip
    newbag = Scrabble::TileBag.new
    newbag.class.must_be_kind_of Class
  end

  it "Tile_Bag class intializes with full bag " do
    # skip
    newbag = Scrabble::TileBag.new
    newbag.tiles_remaining.must_equal 98
  end
end

describe "draw_tiles" do
  it "removes tiles from the bag" do
    newbag = Scrabble::TileBag.new
    newbag.draw_tiles(1)
    newbag.tiles_remaining.must_equal 97
  end
  it "raises an error if passed a string" do
    newbag = Scrabble::TileBag.new
    proc {
      newbag.draw_tiles("word")
    }.must_raise NoMethodError
  end
  it "returns an array " do
    newbag = Scrabble::TileBag.new
    newbag.draw_tiles(7).length.must_equal 7
  end
end

describe "Test tiles_remaining method" do
  it "tiles_remaining returns array that is 98 - 7 tiles long" do
    newbag = Scrabble::TileBag.new
    newbag.draw_tiles(7)
    newbag.tiles_remaining.must_equal 91
  end

end
