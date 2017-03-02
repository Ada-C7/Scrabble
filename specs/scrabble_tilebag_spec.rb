require_relative '../specs/spec_helper.rb'
require_relative '../lib/scrabble_tilebag'

describe "TileBag class" do

  before do
    @tiles = Scrabble::TileBag.new
  end

  describe "Scrabble::TileBag#initialize" do
    it "Responds to an instance of bag_of_tiles" do
      @tiles.must_respond_to :bag_of_tiles
    end

    describe "draw_tiles" do
      it "It returns an array of tiles from TileBag" do
        new_tiles = @tiles.draw_tiles(4)
        new_tiles.must_be_instance_of Array
        new_tiles.length.must_equal 4
      end
      it "Removes correct number of tiles from bag_of_tiles" do
        first_draw = @tiles.bag_of_tiles.length
        @tiles.draw_tiles(5)
        second_draw = @tiles.bag_of_tiles.length
        first_draw.wont_equal second_draw
      end
      it "Cannot draw more than 7 tiles" do
        proc { @tiles.draw_tiles(8) }.must_raise ArgumentError
      end
    end

    describe "tiles remaining" do
      it "Returns arary of remaining tiles in bag" do
        3.times { @tiles.draw_tiles(7) }
        @tiles.tiles_remaining.must_be_instance_of Array
        @tiles.tiles_remaining.length.must_equal 77
      end

      it "Prints out a message if array is empty" do
        14.times { @tiles.draw_tiles(7) }
        proc { @tiles.tiles_remaining}.must_output(/.+/)
      end
    end

  end
end
