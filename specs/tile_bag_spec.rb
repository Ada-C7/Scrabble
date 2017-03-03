# require 'simplecov'
# SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/tile_bag.rb'

describe "TileBag" do
  describe "initalize" do
    let (:tile_bag) {Scrabble::TileBag.new}

    it "can be instantiated" do
      tile_bag.must_be_instance_of Scrabble::TileBag
    end

    it "creates an array of default tiles" do
      tile_bag.must_respond_to :tiles
      tile_bag.tiles.must_be_instance_of Array
    end

    it "makes the elements of the tile array single letter strings" do
      tile_bag.tiles.each do |tile|
        tile.must_be_instance_of String
        tile.length == 1
      end
    end
  end

  describe "draw_tiles" do
    it "returns an array" do
      tile_bag = Scrabble::TileBag.new

      tiles_drawn = tile_bag.draw_tiles(3)
      tiles_drawn.must_be_instance_of Array
    end

    it "removes the correct number of tiles from the tiles array" do
      tile_bag = Scrabble::TileBag.new
      initial_num_of_tiles = tile_bag.tiles

      tile_bag.draw_tiles(3)
      expected_tiles_left = initial_num_of_tiles - 3

      tile_bag.tiles.must_equal expected_tiles_left
    end

    it "draws the correct number of tiles" do
      tile_bag = Scrabble::TileBag.new
      tiles_drawn = tile_bag.draw_tiles(5)

      tiles_drawn.size.must_equal 5
    end

    it "raises an error if the argument isn't an integer" do
      tile_bag = Scrabble::TileBag.new

      proc {
        tile_bag.draw_tiles("two")
      }.must_raise ArgumentError
    end

    it "requires a positive argument" do
      tile_bag = Scrabble::TileBag.new

      proc {
        tile_bag.draw_tiles(-5)
      }.must_raise ArgumentError
    end

    # it "outputs a warning if the # of requested tiles > # of tiles remaining" do
    #
    # end
    #
    # it "doesnt modify the tiles array if there's not enough tiles in the bag" do
    #
    # end
    #
    # it "doesnt modify the tiles array if 0 tiles are drawn" do

  end
#
#   describe "tiles_remaining" do
#     it "returns an integer" do
#       tile_bag = Scrabble::TileBag.new
#       tile_bag.tiles_remaining.must_be_instance_of Integer
#     end
#
#     it "returns # of tiles left in the bag" do
#       tile_bag = Scrabble::TileBag.new
#       default_number_of_tiles = tile_bag.tiles
#       tile_bag.draw(10)
#       tile_bag.tiles_remaining.must_equal default_number_of_tiles - 10
#
#     end
#
#     it "returns the default # of tiles if no tiles have been drawn" do
#       tile_bag = Scrabble::TileBag.new
#       default_number_of_tiles = tile_bag.tiles
#       tile_bag.tiles_remaining.must_equal default_number_of_tiles
#     end
#   end
end
