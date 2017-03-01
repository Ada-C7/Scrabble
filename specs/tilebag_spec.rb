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


  describe "draw_tiles(num)" do
    it "" do

    end
  end
  describe "tiles_remaining" do
    it "" do

    end
  end

end
