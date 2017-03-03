require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/tile_bag'
Minitest::Reporters.use!

describe "Scrabble#TileBag" do
  describe "TileBag#create_tile_bag" do
    it "returns an array" do
      Scrabble::TileBag.create_tile_bag.class.must_equal Array
    end
    it "returns an array full of single letter string" do
      tile_bag = Scrabble::TileBag.create_tile_bag
      tile_bag.each do |letter|
        letter.length.must_equal 1
        letter.class.must_equal String
      end
    end
  end#end of TileBag#create_tile_bag

  describe "TileBag#initialize" do
    it "Creates new instance of TileBag class" do
      Scrabble::TileBag.new.class.must_equal Scrabble::TileBag
    end
    it "instance must respond to tile_bag" do
      Scrabble::TileBag.new.must_respond_to :tile_bag
    end
    it "initializes with an array" do
      tile_bag1 = Scrabble::TileBag.new
      tile_bag1.tile_bag.class.must_equal Array
    end
  end#end of TileBag#initialize

  describe "TileBag#drawn_tiles(num)" do
    it  "Raises ArgumentError if parameter is not an integer" do
      proc {
        bag = Scrabble::TileBag.new
        bag.draw_tiles("4")
      }.must_raise ArgumentError
    end
    it  "Returns an array" do
      bag = Scrabble::TileBag.new
      bag.draw_tiles(5).class.must_equal Array
    end
    it "Method deletes drawn tiles from tile bag" do
      bag = Scrabble::TileBag.new
      original_number_of_tiles = bag.tile_bag.length
      players_tiles = bag.draw_tiles(4)
      expected_number = original_number_of_tiles - 4
      bag.tile_bag.length.must_equal expected_number
    end
    it  "Resulting array of letters must contain letter from tile_bag" do
      bag = Scrabble::TileBag.new
      # used clone method to copy actual array's values,
      # not a references to array:
      original_tile_bag = bag.tile_bag.clone
      array_of_tiles = bag.draw_tiles(5)
      array_of_tiles.each do |tile|
        original_tile_bag.must_include tile
      end
    end
  end#TileBag#draw_tiles

  describe "TileBag#tiles_remaining" do
    it "Returns an Integer" do
      bag = Scrabble::TileBag.new
      bag.tiles_remaining.class.must_equal Integer
    end
    it "Length of remaining tiles must be less than length tile_bag" do
      bag = Scrabble::TileBag.new
      bag.draw_tiles(5)
      bag.tiles_remaining.must_equal 93
    end
  end
end#end of Scrabble::TileBag
