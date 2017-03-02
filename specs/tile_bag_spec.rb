require_relative 'spec_helper'
require_relative '../lib/tile_bag'

describe "Wave 3" do
  before do
    @new_bag = Scrabble::TileBag.new
  end

  describe "TileBag#initialize" do
    it "tiles_left is an array" do
      @new_bag.tiles_left.must_be_instance_of Array
    end

    it "initial bag has 98 tiles" do
      @new_bag.tiles_left.length.must_equal 98
    end

  end


end
