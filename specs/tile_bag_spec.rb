require_relative 'spec_helper'
require_relative '../lib/tile_bag'

describe "TileBag tests" do
  before do
    @new_bag = Scrabble::TileBag.new
  end

  describe "TileBag#initialize" do
    it "tiles_in_bag is an array" do
      @new_bag.tiles_in_bag.must_be_instance_of Array
    end

    it "initial bag has 98 tiles" do
      @new_bag.tiles_in_bag.length.must_equal 98
    end

    it "initial bag has correct number of As and Es" do
      @new_bag.tiles_in_bag.count { |tile| tile == "A" }.must_equal 9
      @new_bag.tiles_in_bag.count { |tile| tile == "E" }.must_equal 12
    end

    describe "TileBag#draw_tiles(num)" do
      it "raises an error if anything other than an integer is passed in as num" do
        proc {@new_bag.draw_tiles("3")}.must_raise ArgumentError

        proc {@new_bag.draw_tiles(4.0)}.must_raise ArgumentError

        proc {@new_bag.draw_tiles(true)}.must_raise ArgumentError

      end

      it "raises an error if num is a negative number or 0" do
        proc {@new_bag.draw_tiles(0)}.must_raise ArgumentError

        proc {@new_bag.draw_tiles(-4)}.must_raise ArgumentError

      end

      it "returns a collection of random tiles" do
        @new_bag.draw_tiles(5).must_be_instance_of Array
        @new_bag.draw_tiles(5).length.must_equal 5
      end

      it "removes the correct tiles from the tile bag" do
        original_tiles = @new_bag.tiles_in_bag.sort
        drawn_tiles = @new_bag.draw_tiles(6)
        leftover_tiles = @new_bag.tiles_in_bag

        (leftover_tiles + drawn_tiles).sort.must_equal original_tiles
      end

      it "drawing tiles from different tilebags (usually) returns different tile arrays" do
        original_drawn_tiles = @new_bag.draw_tiles(7)
        new_drawn_tiles = []
        50.times { new_drawn_tiles << Scrabble::TileBag.new.draw_tiles(7) }

        new_drawn_tiles.each_with_index do |tiles, i|
          new_drawn_tiles[i] = (tiles == original_drawn_tiles ? "match" : "diff")
        end

        new_drawn_tiles.must_include "diff"
      end

      it "drawing tiles from the same tilebag will return (at least some) different tile arrays" do
        original_drawn_tiles = @new_bag.draw_tiles(7)
        new_drawn_tiles = []
        13.times { new_drawn_tiles << @new_bag.draw_tiles(7)}

        new_drawn_tiles.each_with_index do |tiles, i|
          new_drawn_tiles[i] = (tiles == original_drawn_tiles ? "match" : "diff")
        end

        new_drawn_tiles.must_include "diff"
      end
    end

    describe "TileBag#tiles_remaining" do
      it "returns the number of tiles left in bag" do
        @new_bag.draw_tiles(3)
        @new_bag.tiles_remaining.must_equal 95
      end
    end
  end
end
