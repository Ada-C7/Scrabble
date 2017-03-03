require 'rake/testtask'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
# require 'csv'
require_relative '../lib/scoring'
require_relative '../lib/player'
require_relative '../lib/tile_bag'



Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

describe "Wave 3 :: TileBag" do

  it "check that tiles are in an array" do
    tile_bag = Scrabble::TileBag.new
    tile_bag.initialize.must_be_kind_of Array
  end

  it "output length of the array of the method draw_tiles should match the input of requested number of tiles" do
    tile_bag = Scrabble::TileBag.new
    tile_bag.draw_tiles(3).length.must_equal 3
  end

  it "returns number of tiles remaining in the bag" do
    tile_bag = Scrabble::TileBag.new
    tile_bag.draw_tiles(10)
    tile_bag.tiles_remaining.must_equal 86
  end

  it "num argument must be an Integer" do
    tile_bag = Scrabble::TileBag.new
    proc {
      tile_bag.draw_tiles("")
    }.must_raise ArgumentError
  end

end
