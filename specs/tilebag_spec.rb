require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/tilebag'

describe "TileBag class" do
  describe "initialize" do
    it "Initializes instance of all default tiles" do
      tiles = Scrabble::TileBag.new
      tiles.tiles.wont_be_empty
    end
  end

  describe "draw_tiles method" do
    it "Returns a collection of random tiles" do
      tiles = Scrabble::TileBag.new
      tiles.draw_tiles(7)
      tiles.drawn_tiles.length.must_equal 7

    end

    it "Removes the tiles from the default set" do
      tiles = Scrabble::TileBag.new
      tiles.draw_tiles(7)
      tiles.tiles.length.must_equal 91
    end
  end

  describe "tiles_remaining method" do
    it "Returns the tiles remaining in the bag" do
      tiles = Scrabble::TileBag.new
      tiles.tiles_remaining.must_equal 98
    end

    it "Returns tiles remaining in the bag after tiles have been drawn" do
      tiles = Scrabble::TileBag.new
      tiles.draw_tiles(7)
      tiles.tiles_remaining.must_equal 91
    end
  end
end
