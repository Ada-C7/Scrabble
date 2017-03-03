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
  describe "TileBag#Draw_Tiles" do
    it "check that tiles are in an array" do
      tiles = Scrabble::TileBag.new
      tiles.tile_bag.must_be_kind_of Array
    end

    it "output length of the array of the method draw_tiles should match the input of requested number of tiles" do
      tiles = Scrabble::TileBag.new
      tiles.draw_tiles(3).length.must_equal 3
    end

    it "num argument must be an Integer" do
      tiles = Scrabble::TileBag.new
      proc {
        tiles.draw_tiles("")
      }.must_raise ArgumentError
    end
  end

  describe "TileBag#tiles_remaining" do
    it "returns number of tiles remaining in the bag" do
      tiles = Scrabble::TileBag.new
      tiles.draw_tiles(10)
      tiles.tiles_remaining.must_equal 86
    end

    it "tells you if all tiles are gone " do
      tiles = Scrabble::TileBag.new
      tiles.draw_tiles(100)
      tiles.tiles_remaining.must_equal 0
    end
  end
end
