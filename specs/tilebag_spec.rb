require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/tilebag'

describe "Wave 3: class TileBag" do

  it "check that the initialized collection of all tiles is in a hash" do
    tile_bag_1 = Scrabble::TileBag.new
    tile_bag_1.bag_of_letters.must_be_kind_of Hash
  end

  it "check 1 tile in the collection" do
    tile_bag_1 = Scrabble::TileBag.new
    tile_bag_1.bag_of_letters[:C].must_equal 2
  end

  it "check that draw_tiles returns an array" do
    tile_bag_1 = Scrabble::TileBag.new
    tile_bag_1.draw_tiles(5).must_be_kind_of Array
  end

  it "input argument must be an Integer" do
    tile_bag_1 = Scrabble::TileBag.new
    proc {
      tile_bag_1.draw_tiles("")
    }.must_raise ArgumentError
  end

  it "output length of the array of the method draw_tiles should match
      the input of requested number of tiles" do
      tile_bag_1 = Scrabble::TileBag.new
      tile_bag_1.draw_tiles(3).length.must_equal 3
  end

  it "returns the number of tiles remaining in the bag" do
      tile_bag_1 = Scrabble::TileBag.new
      tile_bag_1.draw_tiles(10)
      tile_bag_1.tiles_remaining.must_equal 88
  end
end #End of describe "Wave 3: class TileBag"
