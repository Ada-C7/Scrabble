require_relative 'spec_helper'
require_relative '../lib/tile_bag'

describe "Wave 3" do
  before do
    @new_bag = Scrabble::TileBag.new
  end

  describe "TileBag#initialize" do
    it "tiles_remaining is an array" do
      @new_bag.tiles_remaining.must_be_instance_of Array
    end

    it "initial bag has 98 tiles" do
      @new_bag.tiles_remaining.length.must_equal 98
    end

    it "initial bag has correct number of some letters" do

      @new_bag.tiles_remaining.count { |tile| tile == "A" }.must_equal 9
      @new_bag.tiles_remaining.count { |tile| tile == "E" }.must_equal 12

      # a_tiles = @new_bag.tiles_remaining.select { |tile| tile == "A" }
      # e_tiles = @new_bag.tiles_remaining.select { |tile| tile == "E" }
      #
      # a_tiles.length.must_equal 9
      # e_tiles.length.must_equal 12
    end

    describe "TileBag#draw_tiles" do
      it "returns a collection of random tiles" do
        @new_bag.draw_tiles(5).must_be_instance_of Array
        @new_bag.draw_tiles(5).length.must_equal 5
      end

      it "removes the randomly selected tiles from tiles_remaining" do
        skip
        drawn_tiles = @new_bag.draw_tiles(4)

        # tile1 = drawn_tiles[0]
        # tile2 = drawn_tiles[1]
        # tile3 = drawn_tiles[2]
        # tile4 = drawn_tiles[3]
        #


        @new_bag.tiles_remaining.length.must_equal 94


        #
        # drawn_tiles = @new_bag.draw_tiles(7)
        #
        # @new_bag.tiles_remaining.length.must_equal 86


      end

    end

  end


end
