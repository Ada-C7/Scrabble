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

  # describe "self.new_tileset" do
  #   it "" do
  #   end
  #
  # end

  # what about checking for non-strings that aren't integers, like "#" or "%" not in quotes?

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
      before_draw = @tilebag.tile_set
      num = 3
      @tilebag.draw_tiles(num)
      after_draw = @tilebag.tile_set
      after_draw.length.must_equal (before_draw.length - num)
    end

    it "@tile_set no longer has the three dealt tiles" do
      before_draw = @tilebag.tile_set
      num = 1
      returned_tiles_array = @tilebag.draw_tiles(num)
      after_draw = @tilebag.tile_set

      letter = returned_tiles_array[0]
      before_count = before_draw.count(letter)
      after_count = after_draw.count(letter)
      after_count.must_equal (before_count - num)

    end

  end
  describe "tiles_remaining" do
    it "" do

    end
  end

end
