require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
# require 'minitest/skip_dsl'
require 'minitest/pride'
require_relative '../lib/scoring'

describe "Test Tile_Bag creation" do
  it "instantiates and can be called" do
    skip
    newbag = Scrabble::TileBag.new
    newbag.class.must_be_kind_of Class
  end

  it "Tile_Bag class initializes with empty player hand []"do
    skip
    newbag = Scrabble::TileBag.new
    newbag.player_hand.length.must_equal 0
  end

  it "Tile_Bag class intializes with full bag " do
    skip
    newbag = Scrabble::TileBag.new
    newbag.tiles_remaining.must_equal 98
  end
end


describe "Test tiles_remaining method" do
  it "tiles_remaining returns array that is 98 - 7 tiles long" do
    newbag = Scrabble::TileBag.new
    starting = newbag.tiles_remaining
    newbag.draw_tiles
    newbag.tiles_remaining.must_equal starting-7

  end

end
