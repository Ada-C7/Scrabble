require_relative 'spec_helper'
require_relative '../lib/tilebag.rb'

describe "Tilebag is a class" do

  before do
    @tilebag = Scrabble::TileBag.new
  end

  it "must be type of TileBag" do
    tilebag = Scrabble::TileBag.new
    tilebag.must_be_instance_of Scrabble::TileBag
  end

  describe "initialize" do
    it "@tile_set must be array" do
      @tilebag.tile_set.must_be_kind_of Array
    end
    it "@tile_set must contain only strings" do
      @tilebag.tile_set.each do |tile|
        tile.must_be_kind_of String
      end
    end
  end

  describe "draw_tiles(num)" do
    it "Raise error if number parameter not given" do
      incorrect_input = [[], "string", nil, {}]
      incorrect_input.each do |class_type|
        proc {@tilebag.draw_tiles(class_type)}.must_raise ArgumentError
      end
    end

    it "Returns an array of string with length num" do
      returned_tiles_array = @tilebag.draw_tiles(2)
      returned_tiles_array.length.must_equal 2
    end

    it "Updates @tile_set correctly" do
      original = Scrabble::TileBag.new
      @tilebag.draw_tiles(3)
      changed_original = @tilebag
      changed_original.tile_set.length.must_equal (original.tile_set.length - 3)
    end

    it "@tile_set no longer has the three dealt tiles" do
      original = Scrabble::TileBag.new
      returned_tiles_array = @tilebag.draw_tiles(1)
      letter = returned_tiles_array[0]
      before_count = original.tile_set.count(letter)
      after_count = @tilebag.tile_set.count(letter)
      after_count.must_equal (before_count - 1)
    end
  end

  describe "tiles_remaining" do
    it "Retruns an integer" do
      @tilebag.tiles_remaining.must_be_kind_of Integer
    end

    it "The integer is the correct amount of tiles remaining" do
      @tilebag.tiles_remaining.must_equal 98
      @tilebag.draw_tiles(3)
      @tilebag.tiles_remaining.must_equal 95
    end
  end

end
