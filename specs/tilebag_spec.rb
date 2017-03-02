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

    end

    xdescribe "draw_tiles(num) method for TileBag class" do

      it "removes num items from the default tile collection " do
      end

      it "returns an array of the letters it removes" do
      end
    end

    xdescribe "tiles_remaining method" do
      it "returns an integer that is the number of items remaining in default tile collection" do
        # default_tiles size
        # draw_tiles(7)
        # tiles_remaining should be initial size - 7
      end
    end

end
