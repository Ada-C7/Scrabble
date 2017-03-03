require_relative 'spec_helper'

require_relative '../lib/tilebag.rb'

describe "Wave 3" do
    before do
        @my_tiles = Scrabble::TileBag.new
    end

    describe "TileBag initialize" do

        it "Tilebag.new is an instance of tilebag" do
            @my_tiles.must_be_instance_of Scrabble::TileBag
        end

        it "has a collection of all default tiles" do
            @my_tiles.tilebag.must_be_instance_of Array
        end

        it "has populated the tilebag with the correct numbers of tiles" do
          sample = @my_tiles.tilebag.find_all {|tile| tile == "o"}
          sample.length.must_equal 8
        end

    end

    describe "draw_tiles(num) method for TileBag class" do

      it "removes num items from the default tile collection " do
        length_before = @my_tiles.tilebag.length
        @my_tiles.draw_tiles(5)
        @my_tiles.tilebag.length.must_equal (length_before - 5)
      end

      it "returns an array of letters" do
        new_tiles = @my_tiles.draw_tiles(5)
        new_tiles.must_be_instance_of Array
        new_tiles[3].must_be_instance_of String
      end
    end

    describe "tiles_remaining method" do
      it "returns an integer that is the number of items remaining in default tile collection" do
        length_before = @my_tiles.tilebag.length
        @my_tiles.draw_tiles(7)
        @my_tiles.tiles_remaining.must_equal (length_before - 7)
      end
    end

end
