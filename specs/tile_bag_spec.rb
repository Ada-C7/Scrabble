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
      tile_bag.must_be_instance_of TileBag
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

    end

    it "removes tiles from the tiles array" do

    end

    it "draws the correct number of tiles" do
      #array.size = num argument
    end

    it "raises an error if the argument isn't an integer" do

    end

    it "requires an positive num" do

    end

    it "outputs a warning if num > tiles remaining" do

    end

    it "doesnt modify tiles array if num > tiles" do
      
    end
  end
end
